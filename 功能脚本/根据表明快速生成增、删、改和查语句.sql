
/*************************************************
  -- Author    : ZP
  -- Created   : 2017/11/13 16:57:47
  -- Ver       : 1.1
  -- Purpose   : 根据表名快速生成表插入和修改过程脚本 
  -- Parameters: 表名
**************************************************/
DECLARE
  l_table_name   VARCHAR2(2000) := '&table_name';
  v_package_name VARCHAR2(100) := '&package_name';
  v_pk           VARCHAR2(60);
BEGIN
  dbms_output.enable(300000);
  l_table_name := UPPER(l_table_name);
  IF v_package_name IS NULL THEN
    v_package_name := 'c_package_name,';
  ELSE
    v_package_name := '''' || v_package_name || ''',';
  END IF;
  SELECT lower(cu.COLUMN_NAME)
    INTO v_pk
    FROM user_cons_columns cu, user_constraints au
   WHERE cu.constraint_name = au.constraint_name
         AND au.constraint_type = 'P'
         AND au.table_name = l_table_name;
  --查询过程
  dbms_output.put_line('/*select t.* from (select ');
  FOR rec IN (SELECT lower(column_name) column_name
                FROM user_tab_columns
               WHERE table_name = l_table_name) LOOP
    IF rec.column_name <> v_pk THEN
      dbms_output.put_line(rec.column_name || ',');
    END IF;
  END LOOP;
  dbms_output.put_line(v_pk);
  dbms_output.put_line('from ' || l_table_name || ')t where t.' || v_pk ||
                       '=${@' || v_pk || '};*/');
  dbms_output.put_line('');
  dbms_output.put_line('');
  --插入过程
  dbms_output.put_line('--==========================================================
--procedure name  : insert_' || lower(l_table_name) || '
--discription     : 
--note            :
--parameter       :
--==========================================================');
  dbms_output.put_line(' procedure insert_' || lower(l_table_name) || '(');
  FOR rec IN (SELECT lower(column_name) column_name, data_type
                FROM user_tab_columns
               WHERE table_name = l_table_name) LOOP
    IF rec.column_name NOT IN ('creation_date',
                               'last_update_date',
                               'created_by',
                               'last_updated_by') THEN
      dbms_output.put_line('p_' || rec.column_name || '  ' ||
                           rec.data_type || ',');
    END IF;
  
  END LOOP;
  dbms_output.put_line('p_user_id NUMBER');
  dbms_output.put_line(') is  v_data ' || lower(l_table_name) ||
                       '%ROWTYPE;   begin');

  FOR rec IN (SELECT lower(column_name) column_name
                FROM user_tab_columns
               WHERE table_name = l_table_name) LOOP
    IF rec.column_name IN ('creation_date', 'last_update_date') THEN
      dbms_output.put_line('v_data.' || rec.column_name || ' := sysdate;');
    ELSIF rec.column_name IN ('created_by', 'last_updated_by') THEN
      dbms_output.put_line('v_data.' || rec.column_name ||
                           ' := p_user_id;');
    ELSE
      dbms_output.put_line('v_data.' || rec.column_name || ' :=  ' || 'p_' ||
                           rec.column_name || ';');
    END IF;
  END LOOP;

  dbms_output.put_line('insert into ' || lower(l_table_name) ||
                       ' values  v_data ;');
  dbms_output.put_line('EXCEPTION
  WHEN OTHERS THEN
    sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || '' '' ||
                                                                                SQLERRM,
                                                   p_created_by              => p_user_id,
                                                   p_package_name            => ' ||
                       v_package_name || '
                                                   p_procedure_function_name => ''insert_' ||
                       lower(l_table_name) ||
                       ''');
    raise_application_error(sys_raise_app_error_pkg.c_error_number,
                            sys_raise_app_error_pkg.g_err_line_id);');
  dbms_output.put_line('end  insert_' || lower(l_table_name) || ';');
  dbms_output.put_line('');
  dbms_output.put_line('');
  --修改过程
  dbms_output.put_line('--==========================================================
--procedure name  : update_' || lower(l_table_name) || '
--discription     : 
--note            :
--parameter       :
--==========================================================');
  dbms_output.put_line(' procedure update_' || lower(l_table_name) || '(');
  FOR rec IN (SELECT lower(column_name) column_name, data_type
                FROM user_tab_columns
               WHERE table_name = l_table_name) LOOP
    IF rec.column_name NOT IN ('creation_date',
                               'last_update_date',
                               'created_by',
                               'last_updated_by') THEN
      dbms_output.put_line('p_' || rec.column_name || '  ' ||
                           rec.data_type || ',');
    END IF;
  END LOOP;

  dbms_output.put_line('p_user_id NUMBER');
  dbms_output.put_line(') is  v_data ' || lower(l_table_name) ||
                       '%ROWTYPE;   begin');
  dbms_output.put_line('update ' || lower(l_table_name) || ' t  set ');
  FOR rec IN (SELECT lower(column_name) column_name
                FROM user_tab_columns
               WHERE table_name = l_table_name) LOOP
    IF rec.column_name IN ('creation_date',
                           'last_update_date',
                           'created_by',
                           'last_updated_by') THEN
      NULL;
    ELSE
      dbms_output.put_line('t.' || rec.column_name || ' =  ' || 'p_' ||
                           rec.column_name || ',');
    END IF;
  END LOOP;
  dbms_output.put_line('t.last_update_date = sysdate,');
  dbms_output.put_line('t.last_updated_by = p_user_id');
  dbms_output.put_line('where t.' || v_pk || '=p_' || v_pk || ';');
  dbms_output.put_line('EXCEPTION
  WHEN OTHERS THEN
    sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || '' '' ||
                                                                                SQLERRM,
                                                   p_created_by              => p_user_id,
                                                   p_package_name            => ' ||
                       v_package_name || '
                                                   p_procedure_function_name => ''update_' ||
                       lower(l_table_name) ||
                       ''');
    raise_application_error(sys_raise_app_error_pkg.c_error_number,
                            sys_raise_app_error_pkg.g_err_line_id);');
  dbms_output.put_line('end  update_' || lower(l_table_name) || ';');
  dbms_output.put_line('');
  dbms_output.put_line('');
  --删除过程
  dbms_output.put_line('--==========================================================
--procedure name  : delete_' || lower(l_table_name) || '
--discription     : 
--note            :
--parameter       :
--==========================================================');
  dbms_output.put_line(' procedure delete_' || lower(l_table_name) || '(');
  dbms_output.put_line('p_' || v_pk || ' NUMBER,');
  dbms_output.put_line('p_user_id NUMBER)IS');
  dbms_output.put_line('begin DELETE FROM ' || lower(l_table_name) || ' t');
  dbms_output.put_line('where t.' || v_pk || '=p_' || v_pk || ';');
  dbms_output.put_line('EXCEPTION
  WHEN OTHERS THEN
    sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || '' '' ||
                                                                                SQLERRM,
                                                   p_created_by              => p_user_id,
                                                   p_package_name            => ' ||
                       v_package_name || '
                                                   p_procedure_function_name => ''delete_' ||
                       lower(l_table_name) ||
                       ''');
    raise_application_error(sys_raise_app_error_pkg.c_error_number,
                            sys_raise_app_error_pkg.g_err_line_id);');
  dbms_output.put_line('end  delete_' || lower(l_table_name) || ';');
EXCEPTION
  WHEN no_data_found THEN
    RAISE_APPLICATION_ERROR(-20001, '表不存在');
END;
