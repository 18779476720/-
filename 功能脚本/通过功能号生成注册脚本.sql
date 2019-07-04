declare

  v_function_code        varchar2(30) := 'PUR5730';
  v_parent_function_code varchar2(30) := 'VENDOR_MAG';

begin


  dbms_output.put_line('WHENEVER SQLERROR EXIT FAILURE ROLLBACK;');
  dbms_output.put_line('WHENEVER OSERROR  EXIT FAILURE ROLLBACK;');
  dbms_output.put_line('');
  dbms_output.put_line('spool INSTALL_' || v_function_code || '.log');
  dbms_output.put_line('');
  dbms_output.put_line('set feedback off');
  dbms_output.put_line('set define off');
  dbms_output.put_line('begin');
  dbms_output.put_line('');
  dbms_output.put_line('  --页面注册');
  dbms_output.put_line('');

  for v in (select '  sys_data_load_pkg.load_sys_service(''' ||
                   se.service_name || ''',''' ||
                   (select p.description
                      from sys_prompts p
                     where p.prompt_code = se.title
                       and p.language = 'ZHS') || ''',1,1,0);' init_service
              from sys_function_service sfs, sys_service se
             where sfs.function_id =
                   (select s.function_id
                      from sys_function s
                     where s.function_code = v_function_code)
               and sfs.service_id = se.service_id(+)) loop
 
    dbms_output.put_line(v.init_service);
 
  end loop;

  if (v_parent_function_code is not null) then
 
    dbms_output.put_line('');
    dbms_output.put_line('  --功能注册（目录）');
    dbms_output.put_line('');
 
    --功能注册（目录）
    for v in (select '  sys_data_load_pkg.load_sys_function(''' ||
                     sv.function_code || ''',''' || sv.function_name ||
                     ''',''' || sv.function_description || ''',''' ||
                     ''',''' || sv.function_level || ''',''' ||
                     sv.function_camp || ''',''' || sv.function_type ||
                     ''',''' || ''',''' || sv.sequence || ''',''' ||
                     sv.foundation_code || ''',''' || sv.icon || ''');' init_function
                from sys_function_vl sv, sys_function s
               where sv.function_code = v_parent_function_code
                 and s.function_id = sv.parent_function_id) loop
   
      dbms_output.put_line(v.init_function);
   
    end loop;
  end if;

  dbms_output.put_line('');
  dbms_output.put_line('  --功能注册');
  dbms_output.put_line('');

  --功能注册
  for v in (select '  sys_data_load_pkg.load_sys_function(''' ||
                   sv.function_code || ''',''' || sv.function_name ||
                   ''',''' || sv.function_description || ''',''' ||
                   s.function_code || ''',''' || sv.function_level ||
                   ''',''' || sv.function_camp || ''',''' ||
                   sv.function_type || ''',''' || se.service_name || ''',''' ||
                   sv.sequence || ''',''' || sv.foundation_code || ''',''' ||
                   sv.icon || ''');' init_function
              from sys_function_vl sv, sys_function s, sys_service se
             where sv.function_code = v_function_code
               and s.function_id(+) = sv.parent_function_id
               and sv.service_id = se.service_id(+)) loop
 
    dbms_output.put_line(v.init_function);
 
  end loop;

  --分配页面
  dbms_output.put_line('');
  dbms_output.put_line('  --分配页面');
  dbms_output.put_line('');

  for v in (select '  sys_data_load_pkg.load_function_service(''' ||
                   se.service_name || ''',''' || se2.service_name || ''');' init_screen
              from sys_function         s,
                   sys_service          se,
                   sys_service          se2,
                   sys_function_service sfs
             where s.function_code = v_function_code
               and sfs.function_id = s.function_id
               and s.service_id = se.service_id
               and sfs.service_id = se2.service_id) loop
 
    dbms_output.put_line(v.init_screen);
 
  end loop;

  dbms_output.put_line('');
  dbms_output.put_line('  --bm分配脚本');
  dbms_output.put_line('');

  for v in (select '  sys_data_load_pkg.load_function_bm(''' ||
                   se.service_name || ''',''' || sfb.bm_name || ''');' init_bm
              from sys_function           s,
                   sys_service            se,
                   sys_function_bm_access sfb
             where s.function_code = v_function_code
               and sfb.function_id = s.function_id
               and s.service_id = se.service_id) loop
 
    dbms_output.put_line(v.init_bm);
 
  end loop;

  dbms_output.put_line('');
  dbms_output.put_line('end;');
  dbms_output.put_line('');
  dbms_output.put_line('/');
  dbms_output.put_line('');
  dbms_output.put_line('commit;');
  dbms_output.put_line('');
  dbms_output.put_line('set feedback on');
  dbms_output.put_line('set define on');
  dbms_output.put_line('spool off');
  dbms_output.put_line('');
  dbms_output.put_line('exit');
  
end;
