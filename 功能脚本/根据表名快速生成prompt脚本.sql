/*************************************************
  -- author    : zhangdada
  -- created   : 2017/11/13 16:57:47
  -- ver       : 1.1
  -- purpose   : 根据表名快速生成prompt脚本
  -- parameters: 表名
**************************************************/
declare
  v_table_name varchar2(100) := 'LJ_PROJECT_BUDGET_HEAD';
  v_titel      varchar2(100) := 'LJ_PRJ';
  v_start      varchar2(1000);
  v_end        varchar2(1000);
  v_str1       varchar2(100) := 'sys_prompt_pkg.sys_prompts_load(''';
  v_str2       varchar2(100) := ''');';
  v_zhs        varchar2(100) := ''',''ZHS'',''';
  v_us         varchar2(100) := ''',''US'',''';
begin
  v_start := 'WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;
spool INITIALIZE_PROMPT.log
set feedback off
set define off
begin';
  v_end   := 'end; 
/
commit;
set feedback on
set define on
spool off
exit';
  dbms_output.put_line(v_start);
  for rec in (select *
                from user_col_comments u
               where upper(u.table_name) = upper(v_table_name)
                 and u.comments is not null) loop
    dbms_output.put_line(v_str1 || v_titel || '.' || rec.column_name ||
                         v_zhs || rec.comments || v_str2);
    dbms_output.put_line(v_str1 || v_titel || '.' || rec.column_name || v_us ||
                         lower(rec.column_name) || v_str2);
  end loop;
  dbms_output.put_line(v_end);
end;
