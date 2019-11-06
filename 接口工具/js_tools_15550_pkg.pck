CREATE OR REPLACE PACKAGE js_tools_15550_pkg IS
  -- Author  : HAITAO CHENG
  -- Created : 2018/2/27 13:44:54
  -- Purpose : 接口代码生成工具 
  /*===============================================
    Copyright (C) Hand Business Consulting Services                                 
                AllRights Reserved                                            
  ================================================
  * ===============================================
  *   PROGRAM NAME:
  *                JS_TOOLS_PKG
  *   DESCRIPTION: 
  *                Joson Wong 工具包
  *   HISTORY: 
  *     1.00   2012-12-20   Joson Wong   CREATION
  *   Update
  *     1.01   2013-5-10    Joson Wong   ADD      输出数据库脚本过程dbscript
  *     1.02   2013-5-27    Joson Wong   ADD      os过程默认值
  *                                      MODIFY   os过程注释
  *     1.03   2013-5-28    Joson Wong   ADD      os过程sequence参数
  *                                      ADD      os过程多语言生成
  *                                      MODIFY   过程名称：
  *                                                 ios --> print_table_insert
  *                                                 uos --> print_table_update
  *                                                 dos --> print_table_delete
  *                                                 os  --> print_table_dml
  *                                                 bm  --> print_bm
  *                                                 grid--> print_grid
  *                                      ADD      输出BM-operation
  *     1.04   2013-5-29    Joson Wong   ADD      输出创建视图脚本过程print_view_ddl
  *                                      ADD      输出创建多语言视图脚本过程print_view_vl
  *     1.05   2013-5-30    Joson Wong   ADD      生成功能注册脚本generate_script_function
  *                                      ADD      生成SYSCODE脚本generate_script_syscode
  *     1.06   2013-7-9     Joson Wong   MODIFY   修改方法参数。如：p_table_name IN VARCHAR2(30)
  *                                                           变更为p_table_name IN user_tables.table_name%TYPE
  *     1.07   2013-10-30   Joson Wong   MODIFY   释放启用字段
  *                                      MODIFY   修正description
  *     1.08   2014-04-24   wanghaitao  ADD      输出SYSPROMPT、SYSMESSAGE的SQL           
  * ==============================================*/

  --==========================================================
  --procedure name  : print_table_insert
  --description     : 输出插入表方法
  --note            : 
  --parameter       : 
  --  p_table_name                    表名
  --  p_sequence_name                 序列名
  --  p_multilanguage_column1         多语言字段名1
  --  p_multilanguage_column2         多语言字段名2
  --  p_multilanguage_column3         多语言字段名3
  --  p_multilanguage_column4         多语言字段名4
  --  p_multilanguage_column5         多语言字段名5
  --==========================================================
  PROCEDURE print_table_insert(p_table_name            IN user_tables.table_name%TYPE,
                               p_sequence_name         IN user_sequences.sequence_name%TYPE DEFAULT NULL,
                               p_multilanguage_column1 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column2 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column3 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column4 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column5 IN user_tab_columns.column_name%TYPE DEFAULT NULL);
  --==========================================================
  --procedure name  : print_table_insert
  --description     : 输出插入表方法, 将变量长度缩短至有效范围
  --note            : add by wwl 2016-12-20
  --parameter       : 
  --  p_table_name                    表名
  --  p_sequence_name                 序列名
  --  p_multilanguage_column1         多语言字段名1
  --  p_multilanguage_column2         多语言字段名2
  --  p_multilanguage_column3         多语言字段名3
  --  p_multilanguage_column4         多语言字段名4
  --  p_multilanguage_column5         多语言字段名5
  --==========================================================
  PROCEDURE print_table_insert_wwl(p_table_name            IN user_tables.table_name%TYPE,
                                   p_sequence_name         IN user_sequences.sequence_name%TYPE DEFAULT NULL,
                                   p_multilanguage_column1 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                                   p_multilanguage_column2 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                                   p_multilanguage_column3 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                                   p_multilanguage_column4 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                                   p_multilanguage_column5 IN user_tab_columns.column_name%TYPE DEFAULT NULL);
  --==========================================================
  --procedure name  : print_table_update
  --description     : 输出更新表方法
  --note            : 
  --parameter       : 
  --  p_table_name                    表名
  --  p_multilanguage_column1         多语言字段名1
  --  p_multilanguage_column2         多语言字段名2
  --  p_multilanguage_column3         多语言字段名3
  --  p_multilanguage_column4         多语言字段名4
  --  p_multilanguage_column5         多语言字段名5
  --==========================================================
  PROCEDURE print_table_update(p_table_name            IN user_tables.table_name%TYPE,
                               p_multilanguage_column1 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column2 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column3 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column4 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column5 IN user_tab_columns.column_name%TYPE DEFAULT NULL);

  --==========================================================
  --procedure name  : print_table_delete
  --description     : 输出删除表方法
  --note            : 
  --parameter       : 
  --  p_table_name                    表名
  --  p_multilanguage_column1         多语言字段名1
  --  p_multilanguage_column2         多语言字段名2
  --  p_multilanguage_column3         多语言字段名3
  --  p_multilanguage_column4         多语言字段名4
  --  p_multilanguage_column5         多语言字段名5
  --==========================================================
  PROCEDURE print_table_delete(p_table_name            IN user_tables.table_name%TYPE,
                               p_multilanguage_column1 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column2 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column3 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column4 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column5 IN user_tab_columns.column_name%TYPE DEFAULT NULL);

  --==========================================================
  --procedure name  : print_table_dml
  --description     : 输出插入、更新、删除表方法
  --note            : 
  --parameter       : 
  --  p_table_name                    表名
  --  p_sequence_name                 序列名
  --  p_multilanguage_column1         多语言字段名1
  --  p_multilanguage_column2         多语言字段名2
  --  p_multilanguage_column3         多语言字段名3
  --  p_multilanguage_column4         多语言字段名4
  --  p_multilanguage_column5         多语言字段名5
  --==========================================================
  PROCEDURE print_table_dml(p_table_name            IN user_tables.table_name%TYPE,
                            p_sequence_name         IN user_sequences.sequence_name%TYPE DEFAULT NULL,
                            p_multilanguage_column1 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                            p_multilanguage_column2 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                            p_multilanguage_column3 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                            p_multilanguage_column4 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                            p_multilanguage_column5 IN user_tab_columns.column_name%TYPE DEFAULT NULL);
  --==========================================================
  --procedure name  : print_view_vl
  --description     : 输出创建多语言视图脚本
  --note            : 
  --parameter       : 
  --  p_table_name                    表名
  --  p_multilanguage_column1         多语言字段名1
  --  p_multilanguage_column2         多语言字段名2
  --  p_multilanguage_column3         多语言字段名3
  --  p_multilanguage_column4         多语言字段名4
  --  p_multilanguage_column5         多语言字段名5
  --==========================================================
  PROCEDURE print_view_vl(p_table_name            IN user_tables.table_name%TYPE,
                          p_multilanguage_column1 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                          p_multilanguage_column2 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                          p_multilanguage_column3 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                          p_multilanguage_column4 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                          p_multilanguage_column5 IN user_tab_columns.column_name%TYPE DEFAULT NULL);
  --==========================================================
  --procedure name  : print_view_ddl
  --description     : 输出创建视图脚本
  --note            : 
  --parameter       : 
  --  p_table_name                    表名
  --  p_multilanguage_column1         多语言字段名1
  --  p_multilanguage_column2         多语言字段名2
  --  p_multilanguage_column3         多语言字段名3
  --  p_multilanguage_column4         多语言字段名4
  --  p_multilanguage_column5         多语言字段名5
  --==========================================================
  PROCEDURE print_view_ddl(p_table_name            IN user_tables.table_name%TYPE,
                           p_multilanguage_column1 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                           p_multilanguage_column2 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                           p_multilanguage_column3 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                           p_multilanguage_column4 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                           p_multilanguage_column5 IN user_tab_columns.column_name%TYPE DEFAULT NULL);

  --==========================================================
  --procedure name  : print_bm
  --description     : 输出bm
  --note            : 
  --parameter       : 
  --  p_table_name             表名
  --  p_package_name           包名
  --  p_procedure_name_insert  插入方法名
  --  p_procedure_name_update  更新方法名
  --  p_procedure_name_delete  删除方法名
  --  p_procedure_name_execute 执行方法名
  --==========================================================
  PROCEDURE print_bm(p_table_name             IN user_tables.table_name%TYPE,
                     p_package_name           IN user_procedures.object_name%TYPE DEFAULT NULL,
                     p_procedure_name_insert  IN user_procedures.procedure_name%TYPE DEFAULT NULL,
                     p_procedure_name_update  IN user_procedures.procedure_name%TYPE DEFAULT NULL,
                     p_procedure_name_delete  IN user_procedures.procedure_name%TYPE DEFAULT NULL,
                     p_procedure_name_execute IN user_procedures.procedure_name%TYPE DEFAULT NULL);

  --==========================================================
  --procedure name  : print_grid
  --description     : 输出表字段grid->column
  --note            : 
  --parameter       : 
  --  p_table_name           表名
  --==========================================================
  PROCEDURE print_grid(p_table_name IN user_tables.table_name%TYPE);

  --==========================================================
  --procedure name  : generate_dbscript
  --description     : 生成数据库脚本
  --note            : 
  --parameter       : 
  --==========================================================
  PROCEDURE generate_dbscript;

  --==========================================================
  --procedure name  : generate_script_function
  --description     : 生成功能注册脚本
  --note            : 
  --parameter       : 
  --==========================================================
  PROCEDURE generate_script_function;

  --==========================================================
  --procedure name  : generate_script_syscode
  --description     : 生成SYSCODE脚本
  --note            : 
  --parameter       : 
  --==========================================================
  PROCEDURE generate_script_syscode;

  --==========================================================
  --procedure name  : print_script_syscode
  --description     : 输出SYSCODE脚本
  --note            : 
  --parameter       : 
  --  p_syscode            系统代码    
  --==========================================================
  PROCEDURE print_script_syscode(p_syscode IN VARCHAR2 DEFAULT NULL);

  --==========================================================
  --procedure name  : print_script_sysprompt
  --description     : 输出SYSPROMPT脚本
  --note            : add by wanghaitao at 2014-04-24 
  --parameter       : 
  --  p_prompt_code 描述代码 
  --  p_zhs_description 中文描述
  --  p_us_description 英文描述
  --  p_need_begin 是否需要begin
  --==========================================================
  PROCEDURE print_script_sysprompt(p_prompt_code     IN VARCHAR2,
                                   p_zhs_description IN VARCHAR2,
                                   p_us_description  IN VARCHAR2,
                                   p_need_begin      IN BOOLEAN DEFAULT FALSE);

  --==========================================================
  --procedure name  : print_script_sysmessage
  --description     : 输出SYSMESSAGE脚本
  --note            : add by wanghaitao at 2014-04-24 
  --parameter       : 
  --  p_message_code 消息代码 
  --  p_zhs_description 中文描述
  --  p_us_description 英文描述
  --  p_need_begin 是否需要begin
  --==========================================================
  PROCEDURE print_script_sysmessage(p_message_code    IN VARCHAR2,
                                    p_zhs_description IN VARCHAR2,
                                    p_us_description  IN VARCHAR2,
                                    p_need_begin      IN BOOLEAN DEFAULT TRUE);

  --==========================================================
  --procedure name  : print_table_query
  --description     : 输出table的Query脚本
  --note            : add by wanghaitao at 2014-10-09 
  --parameter       : 
  --  p_table_name 表名
  --==========================================================
  PROCEDURE print_table_query(p_table_name IN VARCHAR2);

  --==========================================================
  --procedure name  : print_ws_xmlformat_para
  --description     : 输出table的xml节点脚本
  --note            : add by chengwenzhe at 2016-8-29 
  --parameter       : 
  --  p_table_name 表名
  --==========================================================
  PROCEDURE print_ws_xmlformat_para(p_table_name IN VARCHAR2);

  PROCEDURE print_package_invoke(p_package_name VARCHAR2,
                                 p_object_name  VARCHAR2);
  --==========================================================
  --procedure name  : print_xml_by_procedure
  --description     : 根据程序参数输出xml节点脚本
  --note            : add by wanlin.wang at 2016-12-19 
  --parameter       : 
  --  
  --==========================================================
  PROCEDURE print_xml_by_procedure(p_package_name   IN user_procedures.object_name%TYPE,
                                   p_procedure_name IN user_procedures.procedure_name%TYPE);
  PROCEDURE create_eitf_table(p_table_name VARCHAR2);
  PROCEDURE create_itf_table(p_table_name VARCHAR2);
  --PROCEDURE create_itf_srm_pkg(p_table_name VARCHAR2);
  PROCEDURE create_tabel_es(p_table_name         VARCHAR2,
                            p_srm_pk_column_name VARCHAR2,
                            p_es_column_name1    VARCHAR2,
                            p_es_column_name2    IN VARCHAR2 DEFAULT NULL,
                            p_es_column_name3    IN VARCHAR2 DEFAULT NULL);

  --==========================================================
  -- ProcedureName   : create_itf_table
  -- Description     : 创建PKG语句
  -- Note            :
  -- Parameter       :
  -- p_table_name  业务表名
  --==========================================================  
  PROCEDURE create_srm_pkg(p_table_name VARCHAR2);

  PROCEDURE main(p_tmp_table_name     IN VARCHAR2, --定义的表名（防止表名太长）
                 p_table_name         IN VARCHAR2, --业务表名
                 p_srm_pk_column_name IN VARCHAR2 DEFAULT NULL, --业务表主键字段（外部系统相对应的映射）
                 p_es_column_name1    IN VARCHAR2 DEFAULT NULL --映射的外部系统主键ID
                 
                 );
END js_tools_15550_pkg;
/
CREATE OR REPLACE PACKAGE BODY js_tools_15550_pkg IS
  TYPE g_business_group_record IS RECORD(
    business_group       VARCHAR2(30),
    external_system_code VARCHAR2(30));
  TYPE g_business_group_type IS TABLE OF g_business_group_record INDEX BY BINARY_INTEGER;
  c_table_name VARCHAR2(30) := '';
  c_srm_table_space CONSTANT CLOB := 'tablespace SRM_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 160K
    next 1M
    minextents 1
    maxextents unlimited
  );';
  --多语言字段mapping
  TYPE multilanguage_mapping_t IS RECORD(
    column_name             user_tab_columns.column_name%TYPE, --多语言字段名
    multilanguage_name      user_tab_columns.column_name%TYPE, --多语言字段映射名
    multilanguage_var       VARCHAR2(30), --多语言字段描述id名
    multilanguage_table_syn VARCHAR2(30)); --多语言字段对应表别名

  --多语言字段mapping列表
  TYPE multilanguage_mapping_list_t IS TABLE OF multilanguage_mapping_t INDEX BY BINARY_INTEGER;

  --error
  c_error_no_data_found CONSTANT VARCHAR2(30) := '-10000';

  --who
  c_who_1 CONSTANT VARCHAR2(30) := 'CREATION_DATE';
  c_who_2 CONSTANT VARCHAR2(30) := 'CREATED_BY';
  c_who_3 CONSTANT VARCHAR2(30) := 'LAST_UPDATE_DATE';
  c_who_4 CONSTANT VARCHAR2(30) := 'LAST_UPDATED_BY';

  --enable
  c_enable CONSTANT VARCHAR2(30) := 'ENABLED_FLAG';

  --multilanguage
  c_multilanguage_1 CONSTANT VARCHAR2(30) := 'DESCRIPTION_ID';

  --databaseType
  c_databasetype_number   CONSTANT VARCHAR2(30) := 'NUMBER';
  c_databasetype_date     CONSTANT VARCHAR2(30) := 'DATE';
  c_databasetype_varchar2 CONSTANT VARCHAR2(30) := 'VARCHAR2';

  --dataType
  c_datatype_long   CONSTANT VARCHAR2(30) := 'java.lang.Long';
  c_datatype_double CONSTANT VARCHAR2(30) := 'java.lang.Double';
  c_datatype_date   CONSTANT VARCHAR2(30) := 'java.util.Date';
  c_datatype_string CONSTANT VARCHAR2(30) := 'java.lang.String';

  --align
  c_align_left   CONSTANT VARCHAR2(30) := 'left';
  c_align_center CONSTANT VARCHAR2(30) := 'center';
  c_align_right  CONSTANT VARCHAR2(30) := 'right';

  --object type
  c_object_type_dblink       CONSTANT VARCHAR2(30) := 'DATABASE LINK';
  c_object_type_index        CONSTANT VARCHAR2(30) := 'INDEX';
  c_object_type_mview        CONSTANT VARCHAR2(30) := 'MATERIALIZED VIEW';
  c_object_type_package      CONSTANT VARCHAR2(30) := 'PACKAGE';
  c_object_type_package_body CONSTANT VARCHAR2(30) := 'PACKAGE BODY';
  c_object_type_sequence     CONSTANT VARCHAR2(30) := 'SEQUENCE';
  c_object_type_synonym      CONSTANT VARCHAR2(30) := 'SYNONYM';
  c_object_type_table        CONSTANT VARCHAR2(30) := 'TABLE';
  c_object_type_view         CONSTANT VARCHAR2(30) := 'VIEW';

  --constraint type
  c_constraint_type_primary_key CONSTANT VARCHAR2(30) := 'P';
  c_constraint_type_unique      CONSTANT VARCHAR2(30) := 'U';

  --location
  c_location_dataload_script CONSTANT VARCHAR2(30) := 'DATALOAD_SCRIPT';

  --==========================================================
  --procedure name  : p
  --description     : 输出
  --note            : 
  --parameter       : 
  --  p_text           文本
  --==========================================================
  PROCEDURE p(p_text IN VARCHAR2) IS
  
  BEGIN
    dbms_output.put_line(a => p_text);
  END p;

  --==========================================================
  --procedure name  : w
  --description     : 输出文件
  --note            : 
  --parameter       : 
  --  p_file           文件
  --  p_buffer         内容
  --==========================================================
  PROCEDURE w(p_file   IN utl_file.file_type,
              p_buffer IN VARCHAR2) IS
  
  BEGIN
    utl_file.put_line(file => p_file, buffer => p_buffer);
  END w;

  --==========================================================
  --procedure name  : w_header
  --description     : 输出文件头
  --note            : 
  --parameter       : 
  --  p_file           文件
  --  p_spool_log      spool_log
  --==========================================================
  PROCEDURE w_header(p_file      IN utl_file.file_type,
                     p_spool_log IN VARCHAR2) IS
  
  BEGIN
    w(p_file, 'WHENEVER SQLERROR EXIT FAILURE ROLLBACK;');
    w(p_file, 'WHENEVER OSERROR  EXIT FAILURE ROLLBACK;');
    w(p_file, '');
    w(p_file, 'spool ' || p_spool_log);
    w(p_file, '');
    w(p_file, 'set feedback off');
    w(p_file, 'set define off');
    w(p_file, '');
  END w_header;

  --==========================================================
  --procedure name  : w_footer
  --description     : 输出文件脚
  --note            : 
  --parameter       : 
  --  p_file           文件
  --==========================================================
  PROCEDURE w_footer(p_file IN utl_file.file_type) IS
  
  BEGIN
    w(p_file, '/');
    w(p_file, '');
    w(p_file, 'commit;');
    w(p_file, 'set feedback on');
    w(p_file, 'set define on');
    w(p_file, '');
    w(p_file, 'spool off');
    w(p_file, '');
    w(p_file, 'exit');
  END w_footer;

  --==========================================================
  --procedure name  : convert_long_to_varchar2
  --description     : 转换：LONG->VARCHAR2
  --note            : 
  --parameter       : 
  --  p_text                  转换内容
  --return          : 转换内容
  --==========================================================
  FUNCTION convert_long_to_varchar2(p_text IN LONG) RETURN VARCHAR2 IS
    v_return VARCHAR2(4000);
  BEGIN
    v_return := substr(str1 => p_text, pos => 1);
    RETURN v_return;
  
  EXCEPTION
    WHEN OTHERS THEN
      RETURN NULL;
  END convert_long_to_varchar2;

  --==========================================================
  --procedure name  : get_table_pk_name
  --description     : 获取主键名称
  --note            : 
  --parameter       : 
  --  p_table_name           表名
  --return          : 主键名称
  --==========================================================
  FUNCTION get_table_pk_name(p_table_name IN user_tables.table_name%TYPE) RETURN user_constraints.constraint_name%TYPE IS
    v_return user_constraints.constraint_name%TYPE;
  BEGIN
    SELECT uc.constraint_name
      INTO v_return
      FROM user_constraints uc
     WHERE uc.table_name = p_table_name
       AND uc.constraint_type = c_constraint_type_primary_key;
  
    RETURN v_return;
  EXCEPTION
    WHEN no_data_found THEN
      RETURN c_error_no_data_found;
  END get_table_pk_name;

  --==========================================================
  --procedure name  : get_table_colomn_count
  --description     : 获取表字段计数
  --note            : 
  --parameter       : 
  --  p_table_name           表名
  --return          : 表字段计数
  --==========================================================
  FUNCTION get_table_colomn_count(p_table_name IN user_tables.table_name%TYPE) RETURN NUMBER IS
    v_return NUMBER := 0;
  BEGIN
    SELECT COUNT(1)
      INTO v_return
      FROM user_tab_columns utc
     WHERE utc.table_name = p_table_name;
  
    RETURN v_return;
  EXCEPTION
    WHEN OTHERS THEN
      RETURN 0;
  END get_table_colomn_count;

  --==========================================================
  --procedure name  : create_multilanguage_list
  --description     : 创建多语言字段mapping列表
  --note            : 
  --parameter       : 
  --  p_multilanguage_column1         多语言字段名1
  --  p_multilanguage_column2         多语言字段名2
  --  p_multilanguage_column3         多语言字段名3
  --  p_multilanguage_column4         多语言字段名4
  --  p_multilanguage_column5         多语言字段名5
  --return          : 多语言字段mapping列表
  --==========================================================
  FUNCTION create_multilanguage_list(p_multilanguage_column1 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                                     p_multilanguage_column2 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                                     p_multilanguage_column3 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                                     p_multilanguage_column4 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                                     p_multilanguage_column5 IN user_tab_columns.column_name%TYPE DEFAULT NULL) RETURN multilanguage_mapping_list_t IS
    v_multilanguage_mapping_list multilanguage_mapping_list_t; --多语言字段mapping列表
    v_multilanguage_mapping      multilanguage_mapping_t; --多语言字段mapping
    v_count_multilanguage        NUMBER := 0; --多语言字段计数
  BEGIN
    IF p_multilanguage_column1 IS NOT NULL THEN
      v_count_multilanguage := v_count_multilanguage + 1;
    
      v_multilanguage_mapping.column_name             := p_multilanguage_column1;
      v_multilanguage_mapping.multilanguage_name      := 'description' || v_count_multilanguage;
      v_multilanguage_mapping.multilanguage_var       := 'description_id' || v_count_multilanguage;
      v_multilanguage_mapping.multilanguage_table_syn := 'fd' || v_count_multilanguage;
    
      v_multilanguage_mapping_list(v_multilanguage_mapping_list.count + 1) := v_multilanguage_mapping;
    END IF;
    IF p_multilanguage_column2 IS NOT NULL THEN
      v_count_multilanguage := v_count_multilanguage + 1;
    
      v_multilanguage_mapping.column_name             := p_multilanguage_column2;
      v_multilanguage_mapping.multilanguage_name      := 'description' || v_count_multilanguage;
      v_multilanguage_mapping.multilanguage_var       := 'description_id' || v_count_multilanguage;
      v_multilanguage_mapping.multilanguage_table_syn := 'fd' || v_count_multilanguage;
    
      v_multilanguage_mapping_list(v_multilanguage_mapping_list.count + 1) := v_multilanguage_mapping;
    END IF;
    IF p_multilanguage_column3 IS NOT NULL THEN
      v_count_multilanguage := v_count_multilanguage + 1;
    
      v_multilanguage_mapping.column_name             := p_multilanguage_column3;
      v_multilanguage_mapping.multilanguage_name      := 'description' || v_count_multilanguage;
      v_multilanguage_mapping.multilanguage_var       := 'description_id' || v_count_multilanguage;
      v_multilanguage_mapping.multilanguage_table_syn := 'fd' || v_count_multilanguage;
    
      v_multilanguage_mapping_list(v_multilanguage_mapping_list.count + 1) := v_multilanguage_mapping;
    END IF;
    IF p_multilanguage_column4 IS NOT NULL THEN
      v_count_multilanguage := v_count_multilanguage + 1;
    
      v_multilanguage_mapping.column_name             := p_multilanguage_column4;
      v_multilanguage_mapping.multilanguage_name      := 'description' || v_count_multilanguage;
      v_multilanguage_mapping.multilanguage_var       := 'description_id' || v_count_multilanguage;
      v_multilanguage_mapping.multilanguage_table_syn := 'fd' || v_count_multilanguage;
    
      v_multilanguage_mapping_list(v_multilanguage_mapping_list.count + 1) := v_multilanguage_mapping;
    END IF;
    IF p_multilanguage_column5 IS NOT NULL THEN
      v_count_multilanguage := v_count_multilanguage + 1;
    
      v_multilanguage_mapping.column_name             := p_multilanguage_column5;
      v_multilanguage_mapping.multilanguage_name      := 'description' || v_count_multilanguage;
      v_multilanguage_mapping.multilanguage_var       := 'description_id' || v_count_multilanguage;
      v_multilanguage_mapping.multilanguage_table_syn := 'fd' || v_count_multilanguage;
    
      v_multilanguage_mapping_list(v_multilanguage_mapping_list.count + 1) := v_multilanguage_mapping;
    END IF;
  
    RETURN v_multilanguage_mapping_list;
  END create_multilanguage_list;

  --==========================================================
  --procedure name  : get_multilanguage_count
  --description     : 获取多语言字段mapping列表记录数
  --note            : 
  --parameter       : 
  --  p_multilanguage_mapping_list    多语言字段mapping列表
  --return          : 多语言字段mapping列表记录数
  --==========================================================
  FUNCTION get_multilanguage_count(p_multilanguage_mapping_list IN multilanguage_mapping_list_t) RETURN NUMBER IS
    v_return NUMBER := 0;
  BEGIN
    v_return := p_multilanguage_mapping_list.count;
    RETURN v_return;
  
  EXCEPTION
    WHEN OTHERS THEN
      RETURN 0;
  END get_multilanguage_count;

  --==========================================================
  --procedure name  : get_multilanguage_name
  --description     : 获取多语言字段映射名
  --note            : 
  --parameter       : 
  --  p_multilanguage_mapping_list    多语言字段mapping列表
  --  p_column_name                   多语言字段名
  --return          : 多语言字段映射名
  --==========================================================
  FUNCTION get_multilanguage_name(p_multilanguage_mapping_list IN multilanguage_mapping_list_t,
                                  p_column_name                IN user_tab_columns.column_name%TYPE) RETURN user_tab_columns.column_name%TYPE IS
    v_return user_tab_columns.column_name%TYPE;
  
    v_pivot NUMBER;
  BEGIN
    v_pivot := p_multilanguage_mapping_list.first;
    WHILE v_pivot IS NOT NULL
    LOOP
      IF p_multilanguage_mapping_list.exists(v_pivot) THEN
        IF p_column_name = p_multilanguage_mapping_list(v_pivot).column_name THEN
          RETURN p_multilanguage_mapping_list(v_pivot).multilanguage_name;
        END IF;
      END IF;
      v_pivot := p_multilanguage_mapping_list.next(v_pivot);
    END LOOP;
  
    RETURN c_error_no_data_found;
  END get_multilanguage_name;

  --==========================================================
  --procedure name  : get_multilanguage_var
  --description     : 获取多语言字段描述id名
  --note            : 
  --parameter       : 
  --  p_multilanguage_mapping_list    多语言字段mapping列表
  --  p_column_name                   多语言字段名
  --return          : 多语言字段描述id名
  --==========================================================
  FUNCTION get_multilanguage_var(p_multilanguage_mapping_list IN multilanguage_mapping_list_t,
                                 p_column_name                IN user_tab_columns.column_name%TYPE) RETURN VARCHAR2 IS
    v_return VARCHAR2(30);
  
    v_pivot NUMBER;
  BEGIN
    v_pivot := p_multilanguage_mapping_list.first;
    WHILE v_pivot IS NOT NULL
    LOOP
      IF p_multilanguage_mapping_list.exists(v_pivot) THEN
        IF p_column_name = p_multilanguage_mapping_list(v_pivot).column_name THEN
          RETURN p_multilanguage_mapping_list(v_pivot).multilanguage_var;
        END IF;
      END IF;
      v_pivot := p_multilanguage_mapping_list.next(v_pivot);
    END LOOP;
  
    RETURN c_error_no_data_found;
  END get_multilanguage_var;

  --==========================================================
  --procedure name  : get_multilanguage_table_syn
  --description     : 获取多语言字段对应表别名
  --note            : 
  --parameter       : 
  --  p_multilanguage_mapping_list    多语言字段mapping列表
  --  p_column_name                   多语言字段名
  --return          : 多语言字段对应表别名
  --==========================================================
  FUNCTION get_multilanguage_table_syn(p_multilanguage_mapping_list IN multilanguage_mapping_list_t,
                                       p_column_name                IN user_tab_columns.column_name%TYPE) RETURN user_tab_columns.column_name%TYPE IS
    v_return user_tab_columns.column_name%TYPE;
  
    v_pivot NUMBER;
  BEGIN
    v_pivot := p_multilanguage_mapping_list.first;
    WHILE v_pivot IS NOT NULL
    LOOP
      IF p_multilanguage_mapping_list.exists(v_pivot) THEN
        IF p_column_name = p_multilanguage_mapping_list(v_pivot).column_name THEN
          RETURN p_multilanguage_mapping_list(v_pivot).multilanguage_table_syn;
        END IF;
      END IF;
      v_pivot := p_multilanguage_mapping_list.next(v_pivot);
    END LOOP;
  
    RETURN c_error_no_data_found;
  END get_multilanguage_table_syn;

  --==========================================================
  --procedure name  : exists_who
  --description     : 判断是否存在WHO字段
  --note            : 前提：表的字段名不重复（这不是废话么⊙﹏⊙b汗）
  --parameter       : 
  --  p_table_name           表名
  --return          : 
  --  TRUE          : 存在
  --  FALSE         ：不存在
  --==========================================================
  FUNCTION exists_who(p_table_name IN user_tables.table_name%TYPE) RETURN BOOLEAN IS
    v_count NUMBER := 0;
  BEGIN
    SELECT COUNT(1)
      INTO v_count
      FROM user_tab_columns c
     WHERE c.table_name = p_table_name
       AND c.column_name IN (c_who_1, c_who_2, c_who_3, c_who_4);
  
    IF v_count = 4 THEN
      RETURN TRUE;
    END IF;
  
    RETURN FALSE;
  END exists_who;

  --==========================================================
  --procedure name  : exists_enable
  --description     : 判断是否存在启用字段字段
  --note            : 
  --parameter       : 
  --  p_table_name           表名
  --return          : 
  --  TRUE          : 存在
  --  FALSE         ：不存在
  --==========================================================
  FUNCTION exists_enable(p_table_name IN user_tables.table_name%TYPE) RETURN BOOLEAN IS
    v_count NUMBER := 0;
  BEGIN
    SELECT COUNT(1)
      INTO v_count
      FROM user_tab_columns c
     WHERE c.table_name = p_table_name
       AND c.column_name IN (c_enable);
  
    IF v_count > 0 THEN
      RETURN TRUE;
    END IF;
  
    RETURN FALSE;
  END exists_enable;

  --==========================================================
  --procedure name  : exists_multilanguage
  --description     : 判断是否存在多语言字段
  --note            : 
  --parameter       : 
  --  p_table_name           表名
  --return          : 
  --  TRUE          : 存在
  --  FALSE         ：不存在
  --==========================================================
  FUNCTION exists_multilanguage(p_table_name IN user_tables.table_name%TYPE) RETURN BOOLEAN IS
    v_count NUMBER := 0;
  BEGIN
    SELECT COUNT(1)
      INTO v_count
      FROM user_tab_columns c
     WHERE c.table_name = p_table_name
       AND c.column_name IN (c_multilanguage_1);
  
    IF v_count > 0 THEN
      RETURN TRUE;
    END IF;
  
    RETURN FALSE;
  END exists_multilanguage;

  --==========================================================
  --procedure name  : print_table_insert
  --description     : 输出插入表方法
  --note            : 
  --parameter       : 
  --  p_table_name                    表名
  --  p_sequence_name                 序列名
  --  p_multilanguage_column1         多语言字段名1
  --  p_multilanguage_column2         多语言字段名2
  --  p_multilanguage_column3         多语言字段名3
  --  p_multilanguage_column4         多语言字段名4
  --  p_multilanguage_column5         多语言字段名5
  --==========================================================
  PROCEDURE print_table_insert(p_table_name            IN user_tables.table_name%TYPE,
                               p_sequence_name         IN user_sequences.sequence_name%TYPE DEFAULT NULL,
                               p_multilanguage_column1 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column2 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column3 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column4 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column5 IN user_tab_columns.column_name%TYPE DEFAULT NULL) IS
    v_table_name     user_tables.table_name%TYPE; --表名
    v_table_comment  user_tab_comments.comments%TYPE; --表备注
    v_pk_name        user_constraints.constraint_name%TYPE; --主键名
    v_pk_column      user_cons_columns.column_name%TYPE; --主键字段名
    v_method_hook    user_tables.table_name%TYPE; --方法后缀
    v_table_syn      VARCHAR2(30); --表别名
    v_var_name       VARCHAR2(30); --表名变量名
    v_procedure_name user_procedures.procedure_name%TYPE; --方法名
    v_data_default   VARCHAR2(4000); --字段默认值
    v_sequence_name  user_sequences.sequence_name%TYPE; --序列名
  
    v_multilanguage_flag         BOOLEAN := FALSE; --多语言标志
    v_multilanguage_mapping_list multilanguage_mapping_list_t; --多语言字段mapping列表
    v_multilanguage_name         user_tab_columns.column_name%TYPE; --多语言字段映射名
    v_pivot                      NUMBER; --指针
  BEGIN
    --===STEP 1:获取基础数据=============BEGIN==================
    v_table_name := upper(p_table_name);
  
    SELECT utc.comments
      INTO v_table_comment
      FROM user_tab_comments utc
     WHERE utc.table_name = v_table_name;
  
    v_pk_name := get_table_pk_name(p_table_name => v_table_name);
    IF v_pk_name = c_error_no_data_found THEN
      RETURN;
    END IF;
  
    SELECT lower(ucc.column_name)
      INTO v_pk_column
      FROM user_cons_columns ucc
     WHERE ucc.table_name = v_table_name
       AND ucc.constraint_name = v_pk_name;
  
    v_method_hook := lower(v_table_name);
    v_table_syn   := 't';
    v_var_name    := 't_' || lower(v_table_name);
  
    BEGIN
      v_procedure_name := 'create_' || v_method_hook;
    
    EXCEPTION
      WHEN OTHERS THEN
        v_procedure_name := 'create_';
    END;
  
    IF p_sequence_name IS NULL THEN
      v_sequence_name := lower(v_table_name) || '_s';
    ELSE
      v_sequence_name := lower(p_sequence_name);
    END IF;
  
    IF p_multilanguage_column1 IS NOT NULL OR p_multilanguage_column2 IS NOT NULL OR p_multilanguage_column3 IS NOT NULL OR p_multilanguage_column4 IS NOT NULL OR p_multilanguage_column5 IS NOT NULL THEN
      v_multilanguage_flag := TRUE;
    
      v_multilanguage_mapping_list := create_multilanguage_list(p_multilanguage_column1 => p_multilanguage_column1,
                                                                p_multilanguage_column2 => p_multilanguage_column2,
                                                                p_multilanguage_column3 => p_multilanguage_column3,
                                                                p_multilanguage_column4 => p_multilanguage_column4,
                                                                p_multilanguage_column5 => p_multilanguage_column5);
    END IF;
    --===STEP 1:获取基础数据=============END====================
  
    --===STEP 2:输出方法注释=============BEGIN==================
    p('--==========================================================');
    p('-- ProcedureName   : ' || v_procedure_name);
    p('-- Description     : 新建-' || v_table_comment);
    p('-- Note            : ');
    p('-- Parameter       : ');
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name,
                         lower(cc.comments) AS comments
                    FROM user_tab_columns  c,
                         user_col_comments cc
                   WHERE c.table_name = v_table_name
                     AND cc.table_name = v_table_name
                     AND cc.column_name = c.column_name
                     AND c.column_name = upper(v_pk_column)
                   ORDER BY c.column_id ASC)
    LOOP
      p('--  o_' || v_rec.column_name || chr(9) || v_rec.comments);
    END LOOP;
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name,
                         lower(cc.comments) AS comments
                    FROM user_tab_columns  c,
                         user_col_comments cc
                   WHERE c.table_name = v_table_name
                     AND cc.table_name = v_table_name
                     AND cc.column_name = c.column_name
                     AND c.column_name NOT IN (c_who_1, c_who_2, c_who_3, c_who_4, upper(v_pk_column))
                   ORDER BY c.column_id ASC)
    LOOP
      IF v_multilanguage_flag = TRUE THEN
        v_multilanguage_name := get_multilanguage_name(p_multilanguage_mapping_list => v_multilanguage_mapping_list, p_column_name => v_rec.column_name);
        IF c_error_no_data_found <> v_multilanguage_name THEN
          p('--  p_' || v_multilanguage_name || chr(9) || v_rec.comments);
        ELSE
          p('--  p_' || v_rec.column_name || chr(9) || v_rec.comments);
        END IF;
      ELSE
        p('--  p_' || v_rec.column_name || chr(9) || v_rec.comments);
      END IF;
    END LOOP;
  
    IF v_multilanguage_flag = FALSE THEN
      NULL;
    ELSIF v_multilanguage_flag = TRUE THEN
      p('--  p_language_code' || chr(9) || '语言代码');
    END IF;
  
    p('--  p_user_id' || chr(9) || '用户id');
    p('--==========================================================');
    --===STEP 2:输出方法注释=============END====================
  
    --===STEP 3:输出方法头===============BEGIN==================
    p('PROCEDURE ' || v_procedure_name || ' (');
    p('o_' || v_pk_column || ' OUT NUMBER,');
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name,
                         c.data_type,
                         c.nullable,
                         c.data_default
                    FROM user_tab_columns c
                   WHERE c.table_name = v_table_name
                     AND c.column_name NOT IN (c_who_1, c_who_2, c_who_3, c_who_4, upper(v_pk_column))
                   ORDER BY c.column_id ASC)
    LOOP
      IF v_multilanguage_flag = FALSE THEN
        IF v_rec.nullable = 'Y' AND (v_rec.data_default IS NULL OR v_rec.data_default = '') THEN
          v_data_default := 'NULL';
        ELSE
          v_data_default := convert_long_to_varchar2(p_text => v_rec.data_default);
        END IF;
        IF v_data_default IS NOT NULL THEN
          p('p_' || v_rec.column_name || ' IN ' || v_rec.data_type || ' DEFAULT ' || v_data_default || ',');
        ELSE
          p('p_' || v_rec.column_name || ' IN ' || v_rec.data_type || ',');
        END IF;
      ELSIF v_multilanguage_flag = TRUE THEN
        v_multilanguage_name := get_multilanguage_name(p_multilanguage_mapping_list => v_multilanguage_mapping_list, p_column_name => v_rec.column_name);
        IF c_error_no_data_found <> v_multilanguage_name THEN
          IF v_rec.nullable = 'N' THEN
            p('p_' || v_multilanguage_name || ' IN ' || v_rec.data_type || ',');
          ELSIF v_rec.nullable = 'Y' THEN
            IF v_rec.data_default IS NULL THEN
              v_data_default := 'NULL';
            ELSE
              v_data_default := convert_long_to_varchar2(p_text => v_rec.data_default);
            END IF;
            p('p_' || v_multilanguage_name || ' IN ' || v_rec.data_type || ' DEFAULT ' || v_data_default || ',');
          END IF;
        ELSIF c_error_no_data_found = v_multilanguage_name THEN
          IF v_rec.nullable = 'N' THEN
            p('p_' || v_rec.column_name || ' IN ' || v_rec.data_type || ',');
          ELSIF v_rec.nullable = 'Y' THEN
            IF v_rec.data_default IS NULL THEN
              v_data_default := 'NULL';
            ELSE
              v_data_default := convert_long_to_varchar2(p_text => v_rec.data_default);
            END IF;
            p('p_' || v_rec.column_name || ' IN ' || v_rec.data_type || ' DEFAULT ' || v_data_default || ',');
          END IF;
        END IF;
      END IF;
    END LOOP;
  
    IF v_multilanguage_flag = FALSE THEN
      NULL;
    ELSIF v_multilanguage_flag = TRUE THEN
      p('p_language_code IN VARCHAR2 DEFAULT USERENV(' || '''' || 'lang' || '''' || '),');
    END IF;
  
    p('p_user_id IN NUMBER');
    p(') IS');
    --===STEP 3:输出方法头===============END====================
  
    --===STEP 4:输出方法体===============BEGIN==================
    --===STEP 4.1:变量声明======================================
    p(v_var_name || '             ' || lower(v_table_name) || '%ROWTYPE;');
  
    IF v_multilanguage_flag = FALSE THEN
      NULL;
    ELSIF v_multilanguage_flag = TRUE THEN
      v_pivot := v_multilanguage_mapping_list.first;
      WHILE v_pivot IS NOT NULL
      LOOP
        IF v_multilanguage_mapping_list.exists(v_pivot) THEN
          p('v_' || v_multilanguage_mapping_list(v_pivot).multilanguage_var || ' NUMBER;');
        END IF;
        v_pivot := v_multilanguage_mapping_list.next(v_pivot);
      END LOOP;
    END IF;
  
    --===STEP 4.2:方法开始======================================
    p('BEGIN');
  
    IF v_multilanguage_flag = FALSE THEN
      NULL;
    ELSIF v_multilanguage_flag = TRUE THEN
      v_pivot := v_multilanguage_mapping_list.first;
      WHILE v_pivot IS NOT NULL
      LOOP
        IF v_multilanguage_mapping_list.exists(v_pivot) THEN
          p('v_' || v_multilanguage_mapping_list(v_pivot).multilanguage_var || ' := fnd_description_pkg.get_fnd_description_id;');
        END IF;
        v_pivot := v_multilanguage_mapping_list.next(v_pivot);
      END LOOP;
      p(chr(32));
    END IF;
  
    IF TRUE = exists_who(v_table_name) THEN
      p(v_var_name || '.' || lower(c_who_1) || ' := SYSDATE;');
      p(v_var_name || '.' || lower(c_who_2) || ' := p_user_id;');
      p(v_var_name || '.' || lower(c_who_3) || ' := SYSDATE;');
      p(v_var_name || '.' || lower(c_who_4) || ' := p_user_id;');
    END IF;
    IF TRUE = exists_enable(v_table_name) THEN
      p(v_var_name || '.' || lower(c_enable) || ' := p_' || lower(c_enable) || ';');
      p(chr(32));
    END IF;
  
    p('SELECT ' || v_sequence_name || '.nextval INTO ' || v_var_name || '.' || v_pk_column || ' FROM dual;');
  
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name
                    FROM user_tab_columns c
                   WHERE c.table_name = v_table_name
                     AND c.column_name NOT IN (c_who_1, c_who_2, c_who_3, c_who_4, upper(v_pk_column))
                   ORDER BY c.column_id ASC)
    LOOP
      IF v_multilanguage_flag = FALSE THEN
        p(v_var_name || '.' || v_rec.column_name || ' := p_' || v_rec.column_name || ';');
      ELSIF v_multilanguage_flag = TRUE THEN
        v_multilanguage_name := get_multilanguage_name(p_multilanguage_mapping_list => v_multilanguage_mapping_list, p_column_name => v_rec.column_name);
        IF c_error_no_data_found <> v_multilanguage_name THEN
          p(v_var_name || '.' || v_rec.column_name || ' := p_' || v_multilanguage_name || ';');
        ELSIF c_error_no_data_found = v_multilanguage_name THEN
          p(v_var_name || '.' || v_rec.column_name || ' := p_' || v_rec.column_name || ';');
        END IF;
      END IF;
    END LOOP;
    p(chr(32));
    p('INSERT INTO ' || lower(v_table_name) || ' VALUES ' || v_var_name || ';');
    p(chr(32));
    p('o_' || v_pk_column || ':=' || v_var_name || '.' || v_pk_column || ';');
  
    IF v_multilanguage_flag = FALSE THEN
      NULL;
    ELSIF v_multilanguage_flag = TRUE THEN
      p(chr(32));
      v_pivot := v_multilanguage_mapping_list.first;
      WHILE v_pivot IS NOT NULL
      LOOP
        IF v_multilanguage_mapping_list.exists(v_pivot) THEN
          p('fnd_description_pkg.reset_fnd_descriptions(p_description_id   => v_' || v_multilanguage_mapping_list(v_pivot).multilanguage_var || ',');
          p('p_ref_table        => ' || '''' || v_table_name || '''' || ',');
          p('p_ref_field        => ' || '''' || upper(v_multilanguage_mapping_list(v_pivot).column_name) || '''' || ',');
          p('p_description_text => p_' || v_multilanguage_mapping_list(v_pivot).multilanguage_name || ',');
          p('p_function_name    => ' || '''' || '' || '''' || ',');
          p('p_language_code    => p_language_code,');
          p('p_created_by       => p_user_id,');
          p('p_last_updated_by  => p_user_id);');
        END IF;
        v_pivot := v_multilanguage_mapping_list.next(v_pivot);
      END LOOP;
      p(chr(32));
    END IF;
  
    p('END ' || v_procedure_name || ';');
    --===STEP 4:输出方法体===============END====================
  END print_table_insert;

  PROCEDURE print_table_insert_wwl(p_table_name            IN user_tables.table_name%TYPE,
                                   p_sequence_name         IN user_sequences.sequence_name%TYPE DEFAULT NULL,
                                   p_multilanguage_column1 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                                   p_multilanguage_column2 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                                   p_multilanguage_column3 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                                   p_multilanguage_column4 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                                   p_multilanguage_column5 IN user_tab_columns.column_name%TYPE DEFAULT NULL) IS
    v_table_name     user_tables.table_name%TYPE; --表名
    v_table_comment  user_tab_comments.comments%TYPE; --表备注
    v_pk_name        user_constraints.constraint_name%TYPE; --主键名
    v_pk_column      user_cons_columns.column_name%TYPE; --主键字段名
    v_method_hook    user_tables.table_name%TYPE; --方法后缀
    v_table_syn      VARCHAR2(30); --表别名
    v_var_name       VARCHAR2(30); --表名变量名
    v_procedure_name user_procedures.procedure_name%TYPE; --方法名
    v_data_default   VARCHAR2(4000); --字段默认值
    v_sequence_name  user_sequences.sequence_name%TYPE; --序列名
  
    v_multilanguage_flag         BOOLEAN := FALSE; --多语言标志
    v_multilanguage_mapping_list multilanguage_mapping_list_t; --多语言字段mapping列表
    v_multilanguage_name         user_tab_columns.column_name%TYPE; --多语言字段映射名
    v_pivot                      NUMBER; --指针
    v_small_name                 VARCHAR2(30);
  BEGIN
    --===STEP 1:获取基础数据=============BEGIN==================
    v_table_name := upper(p_table_name);
  
    SELECT utc.comments
      INTO v_table_comment
      FROM user_tab_comments utc
     WHERE utc.table_name = v_table_name;
  
    v_pk_name := get_table_pk_name(p_table_name => v_table_name);
    IF v_pk_name = c_error_no_data_found THEN
      RETURN;
    END IF;
  
    SELECT lower(ucc.column_name)
      INTO v_pk_column
      FROM user_cons_columns ucc
     WHERE ucc.table_name = v_table_name
       AND ucc.constraint_name = v_pk_name;
  
    v_method_hook := lower(v_table_name);
    v_table_syn   := 't';
    v_var_name    := 't_' || lower(v_table_name);
  
    BEGIN
      v_procedure_name := 'create_' || v_method_hook;
    
    EXCEPTION
      WHEN OTHERS THEN
        v_procedure_name := 'create_';
    END;
  
    IF p_sequence_name IS NULL THEN
      v_sequence_name := lower(v_table_name) || '_s';
    ELSE
      v_sequence_name := lower(p_sequence_name);
    END IF;
  
    IF p_multilanguage_column1 IS NOT NULL OR p_multilanguage_column2 IS NOT NULL OR p_multilanguage_column3 IS NOT NULL OR p_multilanguage_column4 IS NOT NULL OR p_multilanguage_column5 IS NOT NULL THEN
      v_multilanguage_flag := TRUE;
    
      v_multilanguage_mapping_list := create_multilanguage_list(p_multilanguage_column1 => p_multilanguage_column1,
                                                                p_multilanguage_column2 => p_multilanguage_column2,
                                                                p_multilanguage_column3 => p_multilanguage_column3,
                                                                p_multilanguage_column4 => p_multilanguage_column4,
                                                                p_multilanguage_column5 => p_multilanguage_column5);
    END IF;
    --===STEP 1:获取基础数据=============END====================
  
    --===STEP 2:输出方法注释=============BEGIN==================
    p('--==========================================================');
    p('-- ProcedureName   : ' || v_procedure_name);
    p('-- Description     : 新建-' || v_table_comment);
    p('-- Note            : ');
    p('-- Parameter       : ');
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name,
                         lower(cc.comments) AS comments
                    FROM user_tab_columns  c,
                         user_col_comments cc
                   WHERE c.table_name = v_table_name
                     AND cc.table_name = v_table_name
                     AND cc.column_name = c.column_name
                     AND c.column_name = upper(v_pk_column)
                   ORDER BY c.column_id ASC)
    LOOP
      p('--  o_' || v_rec.column_name || chr(9) || v_rec.comments);
    END LOOP;
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name,
                         lower(cc.comments) AS comments
                    FROM user_tab_columns  c,
                         user_col_comments cc
                   WHERE c.table_name = v_table_name
                     AND cc.table_name = v_table_name
                     AND cc.column_name = c.column_name
                     AND c.column_name NOT IN (c_who_1, c_who_2, c_who_3, c_who_4, upper(v_pk_column))
                   ORDER BY c.column_id ASC)
    LOOP
      IF v_multilanguage_flag = TRUE THEN
        v_multilanguage_name := get_multilanguage_name(p_multilanguage_mapping_list => v_multilanguage_mapping_list, p_column_name => v_rec.column_name);
        IF c_error_no_data_found <> v_multilanguage_name THEN
          p('--  p_' || v_multilanguage_name || chr(9) || v_rec.comments);
        ELSE
          p('--  p_' || v_rec.column_name || chr(9) || v_rec.comments);
        END IF;
      ELSE
        p('--  p_' || v_rec.column_name || chr(9) || v_rec.comments);
      END IF;
    END LOOP;
  
    IF v_multilanguage_flag = FALSE THEN
      NULL;
    ELSIF v_multilanguage_flag = TRUE THEN
      p('--  p_language_code' || chr(9) || '语言代码');
    END IF;
  
    p('--  p_user_id' || chr(9) || '用户id');
    p('--==========================================================');
    --===STEP 2:输出方法注释=============END====================
  
    --===STEP 3:输出方法头===============BEGIN==================
    p('PROCEDURE ' || v_procedure_name || ' (');
    p('o_' || v_pk_column || ' OUT NUMBER,');
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name,
                         c.data_type,
                         c.nullable,
                         c.data_default
                    FROM user_tab_columns c
                   WHERE c.table_name = v_table_name
                     AND c.column_name NOT IN (c_who_1, c_who_2, c_who_3, c_who_4, upper(v_pk_column))
                   ORDER BY c.column_id ASC)
    LOOP
      IF length(v_rec.column_name) > 25 THEN
        v_small_name := substr(v_rec.column_name, 1, 25);
      ELSE
        v_small_name := v_rec.column_name;
      END IF;
      IF v_multilanguage_flag = FALSE THEN
        IF v_rec.nullable = 'Y' AND (v_rec.data_default IS NULL OR v_rec.data_default = '') THEN
          v_data_default := 'NULL';
        ELSE
          v_data_default := convert_long_to_varchar2(p_text => v_rec.data_default);
        END IF;
        IF v_data_default IS NOT NULL THEN
        
          p('p_' || v_small_name || ' IN ' || v_rec.data_type || ' DEFAULT ' || v_data_default || ',');
        ELSE
          p('p_' || v_small_name || ' IN ' || v_rec.data_type || ',');
        END IF;
      ELSIF v_multilanguage_flag = TRUE THEN
        v_multilanguage_name := get_multilanguage_name(p_multilanguage_mapping_list => v_multilanguage_mapping_list, p_column_name => v_rec.column_name);
        IF length(v_multilanguage_name) > 25 THEN
          v_multilanguage_name := substr(v_multilanguage_name, 1, 25);
        END IF;
        IF c_error_no_data_found <> v_multilanguage_name THEN
          IF v_rec.nullable = 'N' THEN
            p('p_' || v_multilanguage_name || ' IN ' || v_rec.data_type || ',');
          ELSIF v_rec.nullable = 'Y' THEN
            IF v_rec.data_default IS NULL THEN
              v_data_default := 'NULL';
            ELSE
              v_data_default := convert_long_to_varchar2(p_text => v_rec.data_default);
            END IF;
            p('p_' || v_multilanguage_name || ' IN ' || v_rec.data_type || ' DEFAULT ' || v_data_default || ',');
          END IF;
        ELSIF c_error_no_data_found = v_multilanguage_name THEN
          IF v_rec.nullable = 'N' THEN
            p('p_' || v_small_name || ' IN ' || v_rec.data_type || ',');
          ELSIF v_rec.nullable = 'Y' THEN
            IF v_rec.data_default IS NULL THEN
              v_data_default := 'NULL';
            ELSE
              v_data_default := convert_long_to_varchar2(p_text => v_rec.data_default);
            END IF;
            p('p_' || v_small_name || ' IN ' || v_rec.data_type || ' DEFAULT ' || v_data_default || ',');
          END IF;
        END IF;
      END IF;
    END LOOP;
  
    IF v_multilanguage_flag = FALSE THEN
      NULL;
    ELSIF v_multilanguage_flag = TRUE THEN
      p('p_language_code IN VARCHAR2 DEFAULT USERENV(' || '''' || 'lang' || '''' || '),');
    END IF;
  
    p('p_user_id IN NUMBER');
    p(') IS');
    --===STEP 3:输出方法头===============END====================
  
    --===STEP 4:输出方法体===============BEGIN==================
    --===STEP 4.1:变量声明======================================
    p(v_var_name || '             ' || lower(v_table_name) || '%ROWTYPE;');
  
    IF v_multilanguage_flag = FALSE THEN
      NULL;
    ELSIF v_multilanguage_flag = TRUE THEN
      v_pivot := v_multilanguage_mapping_list.first;
      WHILE v_pivot IS NOT NULL
      LOOP
        IF v_multilanguage_mapping_list.exists(v_pivot) THEN
          p('v_' || v_multilanguage_mapping_list(v_pivot).multilanguage_var || ' NUMBER;');
        END IF;
        v_pivot := v_multilanguage_mapping_list.next(v_pivot);
      END LOOP;
    END IF;
  
    --===STEP 4.2:方法开始======================================
    p('BEGIN');
  
    IF v_multilanguage_flag = FALSE THEN
      NULL;
    ELSIF v_multilanguage_flag = TRUE THEN
      v_pivot := v_multilanguage_mapping_list.first;
      WHILE v_pivot IS NOT NULL
      LOOP
        IF v_multilanguage_mapping_list.exists(v_pivot) THEN
          p('v_' || v_multilanguage_mapping_list(v_pivot).multilanguage_var || ' := fnd_description_pkg.get_fnd_description_id;');
        END IF;
        v_pivot := v_multilanguage_mapping_list.next(v_pivot);
      END LOOP;
      p(chr(32));
    END IF;
  
    IF TRUE = exists_who(v_table_name) THEN
      p(v_var_name || '.' || lower(c_who_1) || ' := SYSDATE;');
      p(v_var_name || '.' || lower(c_who_2) || ' := p_user_id;');
      p(v_var_name || '.' || lower(c_who_3) || ' := SYSDATE;');
      p(v_var_name || '.' || lower(c_who_4) || ' := p_user_id;');
    END IF;
    IF TRUE = exists_enable(v_table_name) THEN
      p(v_var_name || '.' || lower(c_enable) || ' := p_' || lower(c_enable) || ';');
      p(chr(32));
    END IF;
  
    p('SELECT ' || v_sequence_name || '.nextval INTO ' || v_var_name || '.' || v_pk_column || ' FROM dual;');
  
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name
                    FROM user_tab_columns c
                   WHERE c.table_name = v_table_name
                     AND c.column_name NOT IN (c_who_1, c_who_2, c_who_3, c_who_4, upper(v_pk_column))
                   ORDER BY c.column_id ASC)
    LOOP
      IF length(v_rec.column_name) > 25 THEN
        v_small_name := substr(v_rec.column_name, 1, 25);
      ELSE
        v_small_name := v_rec.column_name;
      END IF;
    
      IF v_multilanguage_flag = FALSE THEN
        p(v_var_name || '.' || v_rec.column_name || ' := p_' || v_small_name || ';');
      ELSIF v_multilanguage_flag = TRUE THEN
        v_multilanguage_name := get_multilanguage_name(p_multilanguage_mapping_list => v_multilanguage_mapping_list, p_column_name => v_rec.column_name);
        IF length(v_multilanguage_name) > 25 THEN
          v_multilanguage_name := substr(v_multilanguage_name, 1, 25);
        END IF;
        IF c_error_no_data_found <> v_multilanguage_name THEN
          p(v_var_name || '.' || v_rec.column_name || ' := p_' || v_multilanguage_name || ';');
        ELSIF c_error_no_data_found = v_multilanguage_name THEN
          p(v_var_name || '.' || v_rec.column_name || ' := p_' || v_small_name || ';');
        END IF;
      END IF;
    END LOOP;
    p(chr(32));
    p('INSERT INTO ' || lower(v_table_name) || ' VALUES ' || v_var_name || ';');
    p(chr(32));
    p('o_' || v_pk_column || ':=' || v_var_name || '.' || v_pk_column || ';');
  
    IF v_multilanguage_flag = FALSE THEN
      NULL;
    ELSIF v_multilanguage_flag = TRUE THEN
      p(chr(32));
      v_pivot := v_multilanguage_mapping_list.first;
      WHILE v_pivot IS NOT NULL
      LOOP
        IF v_multilanguage_mapping_list.exists(v_pivot) THEN
          p('fnd_description_pkg.reset_fnd_descriptions(p_description_id   => v_' || v_multilanguage_mapping_list(v_pivot).multilanguage_var || ',');
          p('p_ref_table        => ' || '''' || v_table_name || '''' || ',');
          p('p_ref_field        => ' || '''' || upper(v_multilanguage_mapping_list(v_pivot).column_name) || '''' || ',');
          p('p_description_text => p_' || v_multilanguage_mapping_list(v_pivot).multilanguage_name || ',');
          p('p_function_name    => ' || '''' || '' || '''' || ',');
          p('p_language_code    => p_language_code,');
          p('p_created_by       => p_user_id,');
          p('p_last_updated_by  => p_user_id);');
        END IF;
        v_pivot := v_multilanguage_mapping_list.next(v_pivot);
      END LOOP;
      p(chr(32));
    END IF;
  
    p('END ' || v_procedure_name || ';');
    --===STEP 4:输出方法体===============END====================
  END print_table_insert_wwl;

  --==========================================================
  --procedure name  : print_table_update
  --description     : 输出更新表方法
  --note            : 
  --parameter       : 
  --  p_table_name                    表名
  --  p_multilanguage_column1         多语言字段名1
  --  p_multilanguage_column2         多语言字段名2
  --  p_multilanguage_column3         多语言字段名3
  --  p_multilanguage_column4         多语言字段名4
  --  p_multilanguage_column5         多语言字段名5
  --==========================================================
  PROCEDURE print_table_update(p_table_name            IN user_tables.table_name%TYPE,
                               p_multilanguage_column1 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column2 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column3 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column4 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column5 IN user_tab_columns.column_name%TYPE DEFAULT NULL) IS
    v_table_name     user_tables.table_name%TYPE; --表名
    v_table_comment  user_tab_comments.comments%TYPE; --表备注
    v_pk_name        user_constraints.constraint_name%TYPE; --主键名
    v_pk_column      user_cons_columns.column_name%TYPE; --主键字段名
    v_method_hook    user_tables.table_name%TYPE; --方法后缀
    v_table_syn      VARCHAR2(30); --表别名
    v_var_name       VARCHAR2(30); --表名变量名
    v_procedure_name user_procedures.procedure_name%TYPE; --方法名
    v_data_default   VARCHAR2(4000); --字段默认值
  
    v_count_colunm NUMBER := 0;
    v_count        NUMBER := 0;
  
    v_multilanguage_flag         BOOLEAN := FALSE; --多语言标志
    v_multilanguage_mapping_list multilanguage_mapping_list_t; --多语言字段mapping列表
    v_multilanguage_name         user_tab_columns.column_name%TYPE; --多语言字段映射名
    v_pivot                      NUMBER; --指针
  BEGIN
    --===STEP 1:获取基础数据=============BEGIN==================
    v_table_name := upper(p_table_name);
  
    SELECT utc.comments
      INTO v_table_comment
      FROM user_tab_comments utc
     WHERE utc.table_name = v_table_name;
  
    v_pk_name := get_table_pk_name(p_table_name => v_table_name);
    IF v_pk_name = c_error_no_data_found THEN
      RETURN;
    END IF;
  
    SELECT lower(ucc.column_name)
      INTO v_pk_column
      FROM user_cons_columns ucc
     WHERE ucc.table_name = v_table_name
       AND ucc.constraint_name = v_pk_name;
  
    v_method_hook := lower(v_table_name);
    v_table_syn   := 't';
    v_var_name    := 'v_' || lower(v_table_name);
  
    BEGIN
      v_procedure_name := 'modify_' || v_method_hook;
    
    EXCEPTION
      WHEN OTHERS THEN
        v_procedure_name := 'modify_';
    END;
  
    SELECT COUNT(1)
      INTO v_count_colunm
      FROM user_tab_columns c
     WHERE c.table_name = v_table_name
       AND c.column_name NOT IN (c_who_1, c_who_2, c_who_3, c_who_4, upper(v_pk_column));
  
    IF p_multilanguage_column1 IS NOT NULL OR p_multilanguage_column2 IS NOT NULL OR p_multilanguage_column3 IS NOT NULL OR p_multilanguage_column4 IS NOT NULL OR p_multilanguage_column5 IS NOT NULL THEN
      v_multilanguage_flag := TRUE;
    
      v_multilanguage_mapping_list := create_multilanguage_list(p_multilanguage_column1 => p_multilanguage_column1,
                                                                p_multilanguage_column2 => p_multilanguage_column2,
                                                                p_multilanguage_column3 => p_multilanguage_column3,
                                                                p_multilanguage_column4 => p_multilanguage_column4,
                                                                p_multilanguage_column5 => p_multilanguage_column5);
    END IF;
    --===STEP 1:获取基础数据=============END====================
  
    --===STEP 2:输出方法注释=============BEGIN==================
    p('--==========================================================');
    p('-- ProcedureName   : ' || v_procedure_name);
    p('-- Description     : 更新-' || v_table_comment);
    p('-- Note            : ');
    p('-- Parameter       : ');
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name,
                         lower(cc.comments) AS comments
                    FROM user_tab_columns  c,
                         user_col_comments cc
                   WHERE c.table_name = v_table_name
                     AND cc.table_name = v_table_name
                     AND cc.column_name = c.column_name
                     AND c.column_name = upper(v_pk_column)
                   ORDER BY c.column_id ASC)
    LOOP
      p('--  p_' || v_rec.column_name || chr(9) || v_rec.comments);
    END LOOP;
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name,
                         lower(cc.comments) AS comments
                    FROM user_tab_columns  c,
                         user_col_comments cc
                   WHERE c.table_name = v_table_name
                     AND cc.table_name = v_table_name
                     AND cc.column_name = c.column_name
                     AND c.column_name NOT IN (c_who_1, c_who_2, c_who_3, c_who_4, upper(v_pk_column))
                   ORDER BY c.column_id ASC)
    LOOP
      IF v_multilanguage_flag = FALSE THEN
        p('--  p_' || v_rec.column_name || chr(9) || v_rec.comments);
      ELSIF v_multilanguage_flag = TRUE THEN
        v_multilanguage_name := get_multilanguage_name(p_multilanguage_mapping_list => v_multilanguage_mapping_list, p_column_name => v_rec.column_name);
        IF c_error_no_data_found <> v_multilanguage_name THEN
          p('--  p_' || v_multilanguage_name || chr(9) || v_rec.comments);
        ELSIF c_error_no_data_found = v_multilanguage_name THEN
          p('--  p_' || v_rec.column_name || chr(9) || v_rec.comments);
        END IF;
      END IF;
    END LOOP;
  
    IF v_multilanguage_flag = FALSE THEN
      NULL;
    ELSIF v_multilanguage_flag = TRUE THEN
      p('--  p_language_code' || chr(9) || '语言代码');
    END IF;
  
    p('--  p_user_id' || chr(9) || '用户id');
    p('--==========================================================');
    --===STEP 2:输出方法注释=============END====================
  
    --===STEP 3:输出方法头===============BEGIN==================
    p('procedure ' || v_procedure_name || ' (');
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name,
                         c.data_type,
                         c.nullable,
                         c.data_default
                    FROM user_tab_columns c
                   WHERE c.table_name = v_table_name
                     AND c.column_name = upper(v_pk_column)
                   ORDER BY c.column_id ASC)
    LOOP
      p('p_' || v_rec.column_name || ' IN ' || v_rec.data_type || ',');
    END LOOP;
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name,
                         c.data_type,
                         c.nullable,
                         c.data_default
                    FROM user_tab_columns c
                   WHERE c.table_name = v_table_name
                     AND c.column_name NOT IN (c_who_1, c_who_2, c_who_3, c_who_4, upper(v_pk_column))
                   ORDER BY c.column_id ASC)
    LOOP
      IF v_multilanguage_flag = FALSE THEN
        p('p_' || v_rec.column_name || ' IN ' || v_rec.data_type || ',');
      ELSIF v_multilanguage_flag = TRUE THEN
        v_multilanguage_name := get_multilanguage_name(p_multilanguage_mapping_list => v_multilanguage_mapping_list, p_column_name => v_rec.column_name);
        IF c_error_no_data_found <> v_multilanguage_name THEN
          p('p_' || v_multilanguage_name || ' IN ' || v_rec.data_type || ',');
        ELSIF c_error_no_data_found = v_multilanguage_name THEN
          p('p_' || v_rec.column_name || ' IN ' || v_rec.data_type || ',');
        END IF;
      END IF;
    END LOOP;
  
    IF v_multilanguage_flag = FALSE THEN
      NULL;
    ELSIF v_multilanguage_flag = TRUE THEN
      p('p_language_code IN VARCHAR2 DEFAULT USERENV(' || '''' || 'lang' || '''' || '),');
    END IF;
  
    p('p_user_id IN NUMBER');
    p(') IS');
    --===STEP 3:输出方法头===============END====================
  
    --===STEP 4:输出方法体===============BEGIN==================
    --===STEP 4.1:变量声明======================================
    IF v_multilanguage_flag = FALSE THEN
      p(chr(32));
    ELSIF v_multilanguage_flag = TRUE THEN
      v_pivot := v_multilanguage_mapping_list.first;
      WHILE v_pivot IS NOT NULL
      LOOP
        IF v_multilanguage_mapping_list.exists(v_pivot) THEN
          p('v_' || v_multilanguage_mapping_list(v_pivot).multilanguage_var || ' NUMBER;');
        END IF;
        v_pivot := v_multilanguage_mapping_list.next(v_pivot);
      END LOOP;
    END IF;
  
    --===STEP 4.2:方法开始======================================
    p('BEGIN');
  
    IF v_multilanguage_flag = FALSE THEN
      NULL;
    ELSIF v_multilanguage_flag = TRUE THEN
      v_pivot := v_multilanguage_mapping_list.first;
      WHILE v_pivot IS NOT NULL
      LOOP
        IF v_multilanguage_mapping_list.exists(v_pivot) THEN
          p('SELECT t.' || v_multilanguage_mapping_list(v_pivot).column_name);
          p('  INTO v_' || v_multilanguage_mapping_list(v_pivot).multilanguage_var);
          p('  FROM ' || lower(v_table_name) || ' t');
          p(' WHERE t.' || v_pk_column || ' = p_' || v_pk_column || ';');
        END IF;
        v_pivot := v_multilanguage_mapping_list.next(v_pivot);
      END LOOP;
      p(chr(32));
      v_pivot := v_multilanguage_mapping_list.first;
      WHILE v_pivot IS NOT NULL
      LOOP
        IF v_multilanguage_mapping_list.exists(v_pivot) THEN
          p('fnd_description_pkg.reset_fnd_descriptions(p_description_id   => v_' || v_multilanguage_mapping_list(v_pivot).multilanguage_var || ',');
          p('p_ref_table        => ' || '''' || v_table_name || '''' || ',');
          p('p_ref_field        => ' || '''' || upper(v_multilanguage_mapping_list(v_pivot).column_name) || '''' || ',');
          p('p_description_text => p_' || v_multilanguage_mapping_list(v_pivot).multilanguage_name || ',');
          p('p_function_name    => ' || '''' || '' || '''' || ',');
          p('p_language_code    => p_language_code,');
          p('p_created_by       => p_user_id,');
          p('p_last_updated_by  => p_user_id);');
        END IF;
        v_pivot := v_multilanguage_mapping_list.next(v_pivot);
      END LOOP;
      p(chr(32));
    END IF;
  
    p('UPDATE ' || lower(v_table_name) || ' ' || v_table_syn || ' SET ');
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name
                    FROM user_tab_columns c
                   WHERE c.table_name = v_table_name
                     AND c.column_name IN (c_who_3, c_who_4)
                   ORDER BY c.column_id ASC)
    LOOP
      IF upper(v_rec.column_name) = c_who_3 THEN
        p(v_table_syn || '.' || v_rec.column_name || ' = SYSDATE,');
      ELSIF upper(v_rec.column_name) = c_who_4 THEN
        p(v_table_syn || '.' || v_rec.column_name || ' = p_user_id,');
      END IF;
    END LOOP;
    v_count := 0;
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name
                    FROM user_tab_columns c
                   WHERE c.table_name = v_table_name
                     AND c.column_name NOT IN (c_who_1, c_who_2, c_who_3, c_who_4, upper(v_pk_column))
                   ORDER BY c.column_id ASC)
    LOOP
      v_count := v_count + 1;
    
      IF v_multilanguage_flag = FALSE THEN
        IF v_count < v_count_colunm THEN
          p(v_table_syn || '.' || v_rec.column_name || ' = p_' || v_rec.column_name || ',');
        ELSIF v_count = v_count_colunm THEN
          p(v_table_syn || '.' || v_rec.column_name || ' = p_' || v_rec.column_name);
        END IF;
      ELSIF v_multilanguage_flag = TRUE THEN
        v_multilanguage_name := get_multilanguage_name(p_multilanguage_mapping_list => v_multilanguage_mapping_list, p_column_name => v_rec.column_name);
        IF c_error_no_data_found <> v_multilanguage_name THEN
          IF v_count < v_count_colunm THEN
            p(v_table_syn || '.' || v_rec.column_name || ' = p_' || v_multilanguage_name || ',');
          ELSIF v_count = v_count_colunm THEN
            p(v_table_syn || '.' || v_rec.column_name || ' = p_' || v_multilanguage_name);
          END IF;
        ELSIF c_error_no_data_found = v_multilanguage_name THEN
          IF v_count < v_count_colunm THEN
            p(v_table_syn || '.' || v_rec.column_name || ' = p_' || v_rec.column_name || ',');
          ELSIF v_count = v_count_colunm THEN
            p(v_table_syn || '.' || v_rec.column_name || ' = p_' || v_rec.column_name);
          END IF;
        END IF;
      END IF;
    END LOOP;
    p('WHERE ' || v_table_syn || '.' || v_pk_column || ' =p_' || v_pk_column || ';');
  
    p('END ' || v_procedure_name || ';');
    --===STEP 4:输出方法体===============END====================
  END print_table_update;

  --==========================================================
  --procedure name  : print_table_delete
  --description     : 输出删除表方法
  --note            : 
  --parameter       : 
  --  p_table_name                    表名
  --  p_multilanguage_column1         多语言字段名1
  --  p_multilanguage_column2         多语言字段名2
  --  p_multilanguage_column3         多语言字段名3
  --  p_multilanguage_column4         多语言字段名4
  --  p_multilanguage_column5         多语言字段名5
  --==========================================================
  PROCEDURE print_table_delete(p_table_name            IN user_tables.table_name%TYPE,
                               p_multilanguage_column1 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column2 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column3 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column4 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                               p_multilanguage_column5 IN user_tab_columns.column_name%TYPE DEFAULT NULL) IS
    v_table_name     user_tables.table_name%TYPE; --表名
    v_table_comment  user_tab_comments.comments%TYPE; --表备注
    v_pk_name        user_constraints.constraint_name%TYPE; --主键名
    v_pk_column      user_cons_columns.column_name%TYPE; --主键字段名
    v_method_hook    user_tables.table_name%TYPE; --方法后缀
    v_table_syn      VARCHAR2(30); --表别名
    v_var_name       VARCHAR2(30); --表名变量名
    v_procedure_name user_procedures.procedure_name%TYPE; --方法名
  
    v_multilanguage_flag         BOOLEAN := FALSE; --多语言标志
    v_multilanguage_mapping_list multilanguage_mapping_list_t; --多语言字段mapping列表
    v_multilanguage_name         user_tab_columns.column_name%TYPE; --多语言字段映射名
    v_pivot                      NUMBER; --指针
  BEGIN
    --===STEP 1:获取基础数据=============BEGIN==================
    v_table_name := upper(p_table_name);
  
    SELECT utc.comments
      INTO v_table_comment
      FROM user_tab_comments utc
     WHERE utc.table_name = v_table_name;
  
    v_pk_name := get_table_pk_name(p_table_name => v_table_name);
    IF v_pk_name = c_error_no_data_found THEN
      RETURN;
    END IF;
  
    SELECT lower(ucc.column_name)
      INTO v_pk_column
      FROM user_cons_columns ucc
     WHERE ucc.table_name = v_table_name
       AND ucc.constraint_name = v_pk_name;
  
    v_method_hook := lower(p_table_name);
    v_table_syn   := 't';
    v_var_name    := 'v_' || lower(p_table_name);
  
    BEGIN
      v_procedure_name := 'delete_' || v_method_hook;
    
    EXCEPTION
      WHEN OTHERS THEN
        v_procedure_name := 'delete_';
    END;
  
    IF p_multilanguage_column1 IS NOT NULL OR p_multilanguage_column2 IS NOT NULL OR p_multilanguage_column3 IS NOT NULL OR p_multilanguage_column4 IS NOT NULL OR p_multilanguage_column5 IS NOT NULL THEN
      v_multilanguage_flag := TRUE;
    
      v_multilanguage_mapping_list := create_multilanguage_list(p_multilanguage_column1 => p_multilanguage_column1,
                                                                p_multilanguage_column2 => p_multilanguage_column2,
                                                                p_multilanguage_column3 => p_multilanguage_column3,
                                                                p_multilanguage_column4 => p_multilanguage_column4,
                                                                p_multilanguage_column5 => p_multilanguage_column5);
    END IF;
    --===STEP 1:获取基础数据=============END====================
  
    --===STEP 2:输出方法注释=============BEGIN==================
    p('--==========================================================');
    p('-- ProcedureName   : ' || v_procedure_name);
    p('-- Description     : 删除-' || v_table_comment);
    p('-- Note            : ');
    p('-- Parameter       : ');
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name,
                         cc.comments
                    FROM user_tab_columns  c,
                         user_col_comments cc
                   WHERE c.table_name = v_table_name
                     AND cc.table_name = v_table_name
                     AND cc.column_name = c.column_name
                     AND c.column_name = upper(v_pk_column))
    LOOP
      p('--  p_' || v_rec.column_name || chr(9) || v_rec.comments);
    END LOOP;
  
    IF v_multilanguage_flag = FALSE THEN
      NULL;
    ELSIF v_multilanguage_flag = TRUE THEN
      p('--  p_language_code' || chr(9) || '语言代码');
    END IF;
  
    p('--  p_user_id' || chr(9) || '用户id');
    p('--==========================================================');
    --===STEP 2:输出方法注释=============END====================
  
    --===STEP 3:输出方法头===============BEGIN==================
    p('PROCEDURE ' || v_procedure_name);
    p('(');
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name,
                         c.data_type
                    FROM user_tab_columns c
                   WHERE c.table_name = v_table_name
                     AND c.column_name = upper(v_pk_column))
    LOOP
      p('p_' || v_rec.column_name || ' IN ' || v_rec.data_type || ',');
    END LOOP;
  
    IF v_multilanguage_flag = FALSE THEN
      NULL;
    ELSIF v_multilanguage_flag = TRUE THEN
      p('p_language_code IN VARCHAR2 DEFAULT USERENV(' || '''' || 'lang' || '''' || '),');
    END IF;
  
    p('p_user_id IN NUMBER');
    p(') IS ');
    --===STEP 3:输出方法头===============END====================
  
    --===STEP 4:输出方法体===============BEGIN==================
    --===STEP 4.1:变量声明======================================
    IF v_multilanguage_flag = FALSE THEN
      p(chr(32));
    ELSIF v_multilanguage_flag = TRUE THEN
      v_pivot := v_multilanguage_mapping_list.first;
      WHILE v_pivot IS NOT NULL
      LOOP
        IF v_multilanguage_mapping_list.exists(v_pivot) THEN
          p('v_' || v_multilanguage_mapping_list(v_pivot).multilanguage_var || ' NUMBER;');
        END IF;
        v_pivot := v_multilanguage_mapping_list.next(v_pivot);
      END LOOP;
    END IF;
  
    --===STEP 4.2:方法开始======================================
    p('BEGIN');
  
    IF v_multilanguage_flag = FALSE THEN
      NULL;
    ELSIF v_multilanguage_flag = TRUE THEN
      v_pivot := v_multilanguage_mapping_list.first;
      WHILE v_pivot IS NOT NULL
      LOOP
        IF v_multilanguage_mapping_list.exists(v_pivot) THEN
          p('SELECT t.' || v_multilanguage_mapping_list(v_pivot).column_name);
          p('  INTO v_' || v_multilanguage_mapping_list(v_pivot).multilanguage_var);
          p('  FROM ' || lower(v_table_name) || ' t');
          p(' WHERE t.' || v_pk_column || ' = p_' || v_pk_column || ';');
        END IF;
        v_pivot := v_multilanguage_mapping_list.next(v_pivot);
      END LOOP;
      p(chr(32));
      v_pivot := v_multilanguage_mapping_list.first;
      WHILE v_pivot IS NOT NULL
      LOOP
        IF v_multilanguage_mapping_list.exists(v_pivot) THEN
          p('fnd_description_pkg.delete_fnd_descriptions(p_description_id => v_' || v_multilanguage_mapping_list(v_pivot).multilanguage_var || ',');
          p('p_language       => p_language_code);');
        END IF;
        v_pivot := v_multilanguage_mapping_list.next(v_pivot);
      END LOOP;
      p(chr(32));
    END IF;
  
    p('DELETE FROM ' || lower(v_table_name) || ' ' || v_table_syn || ' WHERE ' || v_table_syn || '.' || v_pk_column || ' = p_' || v_pk_column || ';');
  
    p('END ' || v_procedure_name || ';');
    --===STEP 4:输出方法体===============END====================
  END print_table_delete;

  --==========================================================
  --procedure name  : print_table_dml
  --description     : 输出插入、更新、删除表方法
  --note            : 
  --parameter       : 
  --  p_table_name                    表名
  --  p_sequence_name                 序列名
  --  p_multilanguage_column1         多语言字段名1
  --  p_multilanguage_column2         多语言字段名2
  --  p_multilanguage_column3         多语言字段名3
  --  p_multilanguage_column4         多语言字段名4
  --  p_multilanguage_column5         多语言字段名5
  --==========================================================
  PROCEDURE print_table_dml(p_table_name            IN user_tables.table_name%TYPE,
                            p_sequence_name         IN user_sequences.sequence_name%TYPE DEFAULT NULL,
                            p_multilanguage_column1 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                            p_multilanguage_column2 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                            p_multilanguage_column3 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                            p_multilanguage_column4 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                            p_multilanguage_column5 IN user_tab_columns.column_name%TYPE DEFAULT NULL) IS
  
  BEGIN
    print_table_insert(p_table_name            => p_table_name,
                       p_sequence_name         => p_sequence_name,
                       p_multilanguage_column1 => p_multilanguage_column1,
                       p_multilanguage_column2 => p_multilanguage_column2,
                       p_multilanguage_column3 => p_multilanguage_column3,
                       p_multilanguage_column4 => p_multilanguage_column4,
                       p_multilanguage_column5 => p_multilanguage_column5);
    p(chr(32));
    print_table_update(p_table_name            => p_table_name,
                       p_multilanguage_column1 => p_multilanguage_column1,
                       p_multilanguage_column2 => p_multilanguage_column2,
                       p_multilanguage_column3 => p_multilanguage_column3,
                       p_multilanguage_column4 => p_multilanguage_column4,
                       p_multilanguage_column5 => p_multilanguage_column5);
    p(chr(32));
    print_table_delete(p_table_name            => p_table_name,
                       p_multilanguage_column1 => p_multilanguage_column1,
                       p_multilanguage_column2 => p_multilanguage_column2,
                       p_multilanguage_column3 => p_multilanguage_column3,
                       p_multilanguage_column4 => p_multilanguage_column4,
                       p_multilanguage_column5 => p_multilanguage_column5);
  END print_table_dml;

  --==========================================================
  --procedure name  : print_view_vl
  --description     : 输出创建多语言视图脚本
  --note            : 
  --parameter       : 
  --  p_table_name                    表名
  --  p_multilanguage_column1         多语言字段名1
  --  p_multilanguage_column2         多语言字段名2
  --  p_multilanguage_column3         多语言字段名3
  --  p_multilanguage_column4         多语言字段名4
  --  p_multilanguage_column5         多语言字段名5
  --==========================================================
  PROCEDURE print_view_vl(p_table_name            IN user_tables.table_name%TYPE,
                          p_multilanguage_column1 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                          p_multilanguage_column2 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                          p_multilanguage_column3 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                          p_multilanguage_column4 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                          p_multilanguage_column5 IN user_tab_columns.column_name%TYPE DEFAULT NULL) IS
    v_table_name    user_tables.table_name%TYPE; --表名
    v_table_comment user_tab_comments.comments%TYPE; --表备注
    v_table_syn     VARCHAR2(30); --表别名
  
    v_count_colunm NUMBER := 0;
    v_count        NUMBER := 0;
  
    v_multilanguage_flag         BOOLEAN := FALSE; --多语言标志
    v_count_multilanguage        NUMBER := 0; --多语言字段计数
    v_multilanguage_mapping_list multilanguage_mapping_list_t; --多语言字段mapping列表
    v_multilanguage_name         user_tab_columns.column_name%TYPE; --多语言字段映射名
    v_multilanguage_table_syn    VARCHAR2(30); --多语言字段对应表别名                      
    v_pivot                      NUMBER; --指针
  BEGIN
    v_table_name := upper(p_table_name);
  
    SELECT utc.comments
      INTO v_table_comment
      FROM user_tab_comments utc
     WHERE utc.table_name = v_table_name;
  
    v_table_syn := 't';
  
    SELECT COUNT(1)
      INTO v_count_colunm
      FROM user_tab_columns c
     WHERE c.table_name = v_table_name
       AND c.column_name NOT IN (c_who_1, c_who_2, c_who_3, c_who_4);
  
    IF p_multilanguage_column1 IS NOT NULL OR p_multilanguage_column2 IS NOT NULL OR p_multilanguage_column3 IS NOT NULL OR p_multilanguage_column4 IS NOT NULL OR p_multilanguage_column5 IS NOT NULL THEN
      v_multilanguage_flag := TRUE;
    
      v_multilanguage_mapping_list := create_multilanguage_list(p_multilanguage_column1 => p_multilanguage_column1,
                                                                p_multilanguage_column2 => p_multilanguage_column2,
                                                                p_multilanguage_column3 => p_multilanguage_column3,
                                                                p_multilanguage_column4 => p_multilanguage_column4,
                                                                p_multilanguage_column5 => p_multilanguage_column5);
    
      v_count_multilanguage := get_multilanguage_count(p_multilanguage_mapping_list => v_multilanguage_mapping_list);
    END IF;
  
    p('CREATE VIEW ' || lower(v_table_name) || '_vl AS');
    p('SELECT ');
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name
                    FROM user_tab_columns c
                   WHERE c.table_name = v_table_name
                     AND c.column_name NOT IN (c_who_1, c_who_2, c_who_3, c_who_4)
                   ORDER BY c.column_id ASC)
    LOOP
      v_count := v_count + 1;
    
      IF v_multilanguage_flag = FALSE THEN
        IF v_count < v_count_colunm THEN
          p('t.' || v_rec.column_name || ',');
        ELSIF v_count = v_count_colunm THEN
          p('t.' || v_rec.column_name);
        END IF;
      ELSIF v_multilanguage_flag = TRUE THEN
        v_multilanguage_name := get_multilanguage_name(p_multilanguage_mapping_list => v_multilanguage_mapping_list, p_column_name => v_rec.column_name);
        IF c_error_no_data_found <> v_multilanguage_name THEN
          v_multilanguage_table_syn := get_multilanguage_table_syn(p_multilanguage_mapping_list => v_multilanguage_mapping_list, p_column_name => v_rec.column_name);
          IF v_count < v_count_colunm THEN
            p(v_multilanguage_table_syn || '.description_text AS ' || v_multilanguage_name || ',');
          ELSIF v_count = v_count_colunm THEN
            p(v_multilanguage_table_syn || '.description_text AS ' || v_multilanguage_name);
          END IF;
        ELSIF c_error_no_data_found = v_multilanguage_name THEN
          IF v_count < v_count_colunm THEN
            p('t.' || v_rec.column_name || ',');
          ELSIF v_count = v_count_colunm THEN
            p('t.' || v_rec.column_name);
          END IF;
        END IF;
      END IF;
    END LOOP;
  
    p('  FROM ' || v_table_name || ' ' || v_table_syn || ',');
    v_count := 0;
    v_pivot := v_multilanguage_mapping_list.first;
    WHILE v_pivot IS NOT NULL
    LOOP
      IF v_multilanguage_mapping_list.exists(v_pivot) THEN
        v_count := v_count + 1;
        IF v_count < v_count_multilanguage THEN
          p('fnd_descriptions ' || v_multilanguage_mapping_list(v_pivot).multilanguage_table_syn || ',');
        ELSIF v_count = v_count_multilanguage THEN
          p('fnd_descriptions ' || v_multilanguage_mapping_list(v_pivot).multilanguage_table_syn);
        END IF;
      END IF;
      v_pivot := v_multilanguage_mapping_list.next(v_pivot);
    END LOOP;
  
    p(' WHERE ');
    v_count := 0;
    v_pivot := v_multilanguage_mapping_list.first;
    WHILE v_pivot IS NOT NULL
    LOOP
      IF v_multilanguage_mapping_list.exists(v_pivot) THEN
        v_count := v_count + 1;
        IF v_count > 1 THEN
          p('   AND ');
        END IF;
        p(v_table_syn || '.' || v_multilanguage_mapping_list(v_pivot).column_name || ' = ' || v_multilanguage_mapping_list(v_pivot).multilanguage_table_syn || '.description_id(+)');
        p('   AND ' || v_multilanguage_mapping_list(v_pivot).multilanguage_table_syn || '.language(+) = userenv(' || '''' || 'LANG' || '''' || ')');
        p('   AND ' || v_multilanguage_mapping_list(v_pivot).multilanguage_table_syn || '.ref_table(+) = ' || '''' || v_table_name || '''');
        p('   AND ' || v_multilanguage_mapping_list(v_pivot).multilanguage_table_syn || '.ref_field(+) = ' || '''' || upper(v_multilanguage_mapping_list(v_pivot).column_name) || '''');
        IF v_count = v_count_multilanguage THEN
          p(';');
        END IF;
      END IF;
      v_pivot := v_multilanguage_mapping_list.next(v_pivot);
    END LOOP;
  END print_view_vl;

  --==========================================================
  --procedure name  : print_view_ddl
  --description     : 输出创建视图脚本
  --note            : 
  --parameter       : 
  --  p_table_name                    表名
  --  p_multilanguage_column1         多语言字段名1
  --  p_multilanguage_column2         多语言字段名2
  --  p_multilanguage_column3         多语言字段名3
  --  p_multilanguage_column4         多语言字段名4
  --  p_multilanguage_column5         多语言字段名5
  --==========================================================
  PROCEDURE print_view_ddl(p_table_name            IN user_tables.table_name%TYPE,
                           p_multilanguage_column1 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                           p_multilanguage_column2 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                           p_multilanguage_column3 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                           p_multilanguage_column4 IN user_tab_columns.column_name%TYPE DEFAULT NULL,
                           p_multilanguage_column5 IN user_tab_columns.column_name%TYPE DEFAULT NULL) IS
  
  BEGIN
    print_view_vl(p_table_name            => p_table_name,
                  p_multilanguage_column1 => p_multilanguage_column1,
                  p_multilanguage_column2 => p_multilanguage_column2,
                  p_multilanguage_column3 => p_multilanguage_column3,
                  p_multilanguage_column4 => p_multilanguage_column4,
                  p_multilanguage_column5 => p_multilanguage_column5);
  END print_view_ddl;

  --==========================================================
  --procedure name  : print_bm_field
  --description     : 输出bm->field
  --note            : 
  --parameter       : 
  --  p_table_name           表名
  --==========================================================
  PROCEDURE print_bm_field(p_table_name IN user_tables.table_name%TYPE) IS
    v_table_name user_tables.table_name%TYPE;
  
    v_data_type VARCHAR2(30);
  BEGIN
    v_table_name := upper(p_table_name);
  
    p('    <bm:fields>');
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name,
                         c.data_type
                    FROM user_tab_columns c
                   WHERE c.table_name = v_table_name
                   ORDER BY c.column_id ASC)
    LOOP
      IF v_rec.data_type = c_databasetype_number THEN
        v_data_type := c_datatype_long;
      ELSIF v_rec.data_type = c_databasetype_date THEN
        v_data_type := c_datatype_date;
      ELSIF v_rec.data_type = c_databasetype_varchar2 THEN
        v_data_type := c_datatype_string;
      END IF;
    
      p('        <bm:field name="' || v_rec.column_name || '" databaseType="' || v_rec.data_type || '" datatype="' || v_data_type || '"/>');
    END LOOP;
    p('    </bm:fields>');
  END print_bm_field;

  --==========================================================
  --procedure name  : print_bm_operation_query
  --description     : 输出bm->operation->query
  --note            : 
  --parameter       : 
  --  p_table_name           表名
  --  p_package_name         包名
  --  p_procedure_name       过程名
  --==========================================================
  PROCEDURE print_bm_operation_query(p_table_name     IN user_tables.table_name%TYPE,
                                     p_package_name   IN user_procedures.object_name%TYPE,
                                     p_procedure_name IN user_procedures.procedure_name%TYPE) IS
  
  BEGIN
    NULL;
  END print_bm_operation_query;

  --==========================================================
  --procedure name  : print_bm_operation_insert
  --description     : 输出bm->operation->insert
  --note            : 
  --parameter       : 
  --  p_table_name           表名
  --  p_package_name         包名
  --  p_procedure_name       过程名
  --==========================================================
  PROCEDURE print_bm_operation_insert(p_table_name     IN user_tables.table_name%TYPE,
                                      p_package_name   IN user_procedures.object_name%TYPE,
                                      p_procedure_name IN user_procedures.procedure_name%TYPE) IS
    v_count_argument     NUMBER := 0;
    v_count_argument_out NUMBER := 0;
    v_count              NUMBER := 0;
  BEGIN
    SELECT COUNT(1)
      INTO v_count_argument
      FROM user_arguments ua
     WHERE ua.package_name = p_package_name
       AND ua.object_name = p_procedure_name;
  
    SELECT COUNT(1)
      INTO v_count_argument_out
      FROM user_arguments ua
     WHERE ua.package_name = p_package_name
       AND ua.object_name = p_procedure_name
       AND ua.in_out = 'OUT';
  
    p('        <bm:operation name="insert">');
  
    IF v_count_argument_out > 0 THEN
      p('            <bm:parameters>');
      FOR v_rec IN (SELECT ua.argument_name,
                           ua.data_type AS database_type,
                           decode(ua.data_type, 'VARCHAR2', c_datatype_string, 'NUMBER', c_datatype_long, 'DATE', c_datatype_date) AS data_type
                      FROM user_arguments ua
                     WHERE ua.package_name = p_package_name
                       AND ua.object_name = p_procedure_name
                       AND ua.in_out = 'OUT'
                     ORDER BY ua.sequence ASC)
      LOOP
        p('                <bm:parameter name="' || substr(lower(v_rec.argument_name), 3) || '" dataType="' || v_rec.data_type || '" input="false" output="true" outputPath="/parameter/@' ||
          substr(lower(v_rec.argument_name), 3) || '"/>');
      END LOOP;
      p('            </bm:parameters>');
    END IF;
  
    p('            <bm:update-sql><![CDATA[');
  
    p('              BEGIN');
    p('                ' || lower(p_package_name) || '.' || lower(p_procedure_name));
    p('                (');
    FOR v_rec IN (SELECT ua.argument_name,
                         ua.data_type,
                         ua.in_out
                    FROM user_arguments ua
                   WHERE ua.package_name = p_package_name
                     AND ua.object_name = p_procedure_name
                   ORDER BY ua.sequence ASC)
    LOOP
      v_count := v_count + 1;
    
      IF v_count < v_count_argument THEN
        IF v_rec.argument_name = 'P_USER_ID' THEN
          p('                  p_user_id=>${/session/@user_id},');
        ELSIF v_rec.argument_name = 'P_SESSION_ID' THEN
          p('                  p_session_id=>${/session/@session_id},');
        ELSE
          p('                  ' || lower(v_rec.argument_name) || '=>${@' || substr(upper(v_rec.argument_name), 3) || '},');
        END IF;
      ELSIF v_count = v_count_argument THEN
        IF v_rec.argument_name = 'P_USER_ID' THEN
          p('                  p_user_id=>${/session/@user_id}');
        ELSIF v_rec.argument_name = 'P_SESSION_ID' THEN
          p('                  p_session_id=>${/session/@session_id}');
        ELSE
          p('                  ' || lower(v_rec.argument_name) || '=>${@' || substr(upper(v_rec.argument_name), 3) || '}');
        END IF;
      END IF;
    END LOOP;
    p('                );');
    p('              END;');
  
    p('          ]]></bm:update-sql>');
    p('        </bm:operation>');
  END print_bm_operation_insert;

  --==========================================================
  --procedure name  : print_bm_operation_update
  --description     : 输出bm->operation->update
  --note            : 
  --parameter       : 
  --  p_table_name           表名
  --  p_package_name         包名
  --  p_procedure_name       过程名
  --==========================================================
  PROCEDURE print_bm_operation_update(p_table_name     IN user_tables.table_name%TYPE,
                                      p_package_name   IN user_procedures.object_name%TYPE,
                                      p_procedure_name IN user_procedures.procedure_name%TYPE) IS
    v_count_argument NUMBER := 0;
    v_count          NUMBER := 0;
  BEGIN
    SELECT COUNT(1)
      INTO v_count_argument
      FROM user_arguments ua
     WHERE ua.package_name = p_package_name
       AND ua.object_name = p_procedure_name;
  
    p('        <bm:operation name="update">');
    p('            <bm:update-sql><![CDATA[');
  
    p('              BEGIN');
    p('                ' || lower(p_package_name) || '.' || lower(p_procedure_name));
    p('                (');
    FOR v_rec IN (SELECT ua.argument_name,
                         ua.data_type,
                         ua.in_out
                    FROM user_arguments ua
                   WHERE ua.package_name = p_package_name
                     AND ua.object_name = p_procedure_name
                   ORDER BY ua.sequence ASC)
    LOOP
      v_count := v_count + 1;
    
      IF v_count < v_count_argument THEN
        IF v_rec.argument_name = 'P_USER_ID' THEN
          p('                  p_user_id=>${/session/@user_id},');
        ELSIF v_rec.argument_name = 'P_SESSION_ID' THEN
          p('                  p_session_id=>${/session/@session_id},');
        ELSE
          p('                  ' || lower(v_rec.argument_name) || '=>${@' || substr(lower(v_rec.argument_name), 3) || '},');
        END IF;
      ELSIF v_count = v_count_argument THEN
        IF v_rec.argument_name = 'P_USER_ID' THEN
          p('                  p_user_id=>${/session/@user_id}');
        ELSIF v_rec.argument_name = 'P_SESSION_ID' THEN
          p('                  p_session_id=>${/session/@session_id}');
        ELSE
          p('                  ' || lower(v_rec.argument_name) || '=>${@' || substr(lower(v_rec.argument_name), 3) || '}');
        END IF;
      END IF;
    END LOOP;
    p('                );');
    p('              END;');
  
    p('          ]]></bm:update-sql>');
    p('        </bm:operation>');
  END print_bm_operation_update;

  --==========================================================
  --procedure name  : print_bm_operation_delete
  --description     : 输出bm->operation->delete
  --note            : 
  --parameter       : 
  --  p_table_name           表名
  --  p_package_name         包名
  --  p_procedure_name       过程名
  --==========================================================
  PROCEDURE print_bm_operation_delete(p_table_name     IN user_tables.table_name%TYPE,
                                      p_package_name   IN user_procedures.object_name%TYPE,
                                      p_procedure_name IN user_procedures.procedure_name%TYPE) IS
    v_count_argument NUMBER := 0;
    v_count          NUMBER := 0;
  BEGIN
    SELECT COUNT(1)
      INTO v_count_argument
      FROM user_arguments ua
     WHERE ua.package_name = p_package_name
       AND ua.object_name = p_procedure_name;
  
    p('        <bm:operation name="delete">');
    p('            <bm:update-sql><![CDATA[');
  
    p('              BEGIN');
    p('                ' || lower(p_package_name) || '.' || lower(p_procedure_name));
    p('                (');
    FOR v_rec IN (SELECT ua.argument_name,
                         ua.data_type,
                         ua.in_out
                    FROM user_arguments ua
                   WHERE ua.package_name = p_package_name
                     AND ua.object_name = p_procedure_name
                   ORDER BY ua.sequence ASC)
    LOOP
      v_count := v_count + 1;
    
      IF v_count < v_count_argument THEN
        IF v_rec.argument_name = 'P_USER_ID' THEN
          p('                  p_user_id=>${/session/@user_id},');
        ELSIF v_rec.argument_name = 'P_SESSION_ID' THEN
          p('                  p_session_id=>${/session/@session_id},');
        ELSE
          p('                  ' || lower(v_rec.argument_name) || '=>${@' || substr(lower(v_rec.argument_name), 3) || '},');
        END IF;
      ELSIF v_count = v_count_argument THEN
        IF v_rec.argument_name = 'P_USER_ID' THEN
          p('                  p_user_id=>${/session/@user_id}');
        ELSIF v_rec.argument_name = 'P_SESSION_ID' THEN
          p('                  p_session_id=>${/session/@session_id}');
        ELSE
          p('                  ' || lower(v_rec.argument_name) || '=>${@' || substr(lower(v_rec.argument_name), 3) || '}');
        END IF;
      END IF;
    END LOOP;
    p('                );');
    p('              END;');
  
    p('          ]]></bm:update-sql>');
    p('        </bm:operation>');
  END print_bm_operation_delete;

  --==========================================================
  --procedure name  : print_bm_operation_execute
  --description     : 输出bm->operation->execute
  --note            : 
  --parameter       : 
  --  p_table_name           表名
  --  p_package_name         包名
  --  p_procedure_name       过程名
  --==========================================================
  PROCEDURE print_bm_operation_execute(p_table_name     IN user_tables.table_name%TYPE,
                                       p_package_name   IN user_procedures.object_name%TYPE,
                                       p_procedure_name IN user_procedures.procedure_name%TYPE) IS
    v_count_argument NUMBER := 0;
    v_count          NUMBER := 0;
  BEGIN
    SELECT COUNT(1)
      INTO v_count_argument
      FROM user_arguments ua
     WHERE ua.package_name = p_package_name
       AND ua.object_name = p_procedure_name;
  
    p('        <bm:operation name="execute">');
    p('            <bm:update-sql><![CDATA[');
  
    p('              BEGIN');
    p('                ' || lower(p_package_name) || '.' || lower(p_procedure_name));
    p('                (');
    FOR v_rec IN (SELECT ua.argument_name,
                         ua.data_type,
                         ua.in_out
                    FROM user_arguments ua
                   WHERE ua.package_name = p_package_name
                     AND ua.object_name = p_procedure_name
                   ORDER BY ua.sequence ASC)
    LOOP
      v_count := v_count + 1;
    
      IF v_count < v_count_argument THEN
        IF v_rec.argument_name = 'P_USER_ID' THEN
          p('                  p_user_id=>${/session/@user_id},');
        ELSIF v_rec.argument_name = 'P_SESSION_ID' THEN
          p('                  p_session_id=>${/session/@session_id},');
        ELSE
          p('                  ' || lower(v_rec.argument_name) || '=>${@' || substr(lower(v_rec.argument_name), 3) || '},');
        END IF;
      ELSIF v_count = v_count_argument THEN
        IF v_rec.argument_name = 'P_USER_ID' THEN
          p('                  p_user_id=>${/session/@user_id}');
        ELSIF v_rec.argument_name = 'P_SESSION_ID' THEN
          p('                  p_session_id=>${/session/@session_id}');
        ELSE
          p('                  ' || lower(v_rec.argument_name) || '=>${@' || substr(lower(v_rec.argument_name), 3) || '}');
        END IF;
      END IF;
    END LOOP;
    p('                );');
    p('              END;');
  
    p('          ]]></bm:update-sql>');
    p('        </bm:operation>');
  END print_bm_operation_execute;

  --==========================================================
  --procedure name  : print_bm_operation
  --description     : 输出bm->operation
  --note            : 
  --parameter       : 
  --  p_table_name             表名
  --  p_package_name           包名
  --  p_procedure_name_insert  插入方法名
  --  p_procedure_name_update  更新方法名
  --  p_procedure_name_delete  删除方法名
  --  p_procedure_name_execute 执行方法名
  --==========================================================
  PROCEDURE print_bm_operation(p_table_name             IN user_tables.table_name%TYPE,
                               p_package_name           IN user_procedures.object_name%TYPE,
                               p_procedure_name_insert  IN user_procedures.procedure_name%TYPE DEFAULT NULL,
                               p_procedure_name_update  IN user_procedures.procedure_name%TYPE DEFAULT NULL,
                               p_procedure_name_delete  IN user_procedures.procedure_name%TYPE DEFAULT NULL,
                               p_procedure_name_execute IN user_procedures.procedure_name%TYPE DEFAULT NULL) IS
    v_table_name     user_tables.table_name%TYPE;
    v_package_name   user_procedures.object_name%TYPE;
    v_procedure_name user_procedures.procedure_name%TYPE;
  BEGIN
    v_table_name   := upper(p_table_name);
    v_package_name := upper(p_package_name);
  
    p('    <bm:operations>');
    print_bm_operation_query(p_table_name => v_table_name, p_package_name => v_package_name, p_procedure_name => v_procedure_name);
  
    IF p_procedure_name_insert IS NULL THEN
      v_procedure_name := 'CREATE_' || p_table_name;
    ELSIF p_procedure_name_insert IS NOT NULL THEN
      v_procedure_name := upper(p_procedure_name_insert);
    END IF;
    print_bm_operation_insert(p_table_name => v_table_name, p_package_name => v_package_name, p_procedure_name => v_procedure_name);
  
    IF p_procedure_name_insert IS NULL THEN
      v_procedure_name := 'MODIFY_' || p_table_name;
    ELSIF p_procedure_name_insert IS NOT NULL THEN
      v_procedure_name := upper(p_procedure_name_update);
    END IF;
    print_bm_operation_update(p_table_name => v_table_name, p_package_name => v_package_name, p_procedure_name => v_procedure_name);
  
    IF p_procedure_name_insert IS NULL THEN
      v_procedure_name := 'DELETE_' || p_table_name;
    ELSIF p_procedure_name_insert IS NOT NULL THEN
      v_procedure_name := upper(p_procedure_name_delete);
    END IF;
    print_bm_operation_delete(p_table_name => v_table_name, p_package_name => v_package_name, p_procedure_name => v_procedure_name);
  
    IF p_procedure_name_execute IS NOT NULL THEN
      v_procedure_name := upper(p_procedure_name_execute);
      print_bm_operation_execute(p_table_name => v_table_name, p_package_name => v_package_name, p_procedure_name => v_procedure_name);
    END IF;
    p('    </bm:operations>');
  END print_bm_operation;

  --==========================================================
  --procedure name  : print_bm
  --description     : 输出bm
  --note            : 
  --parameter       : 
  --  p_table_name             表名
  --  p_package_name           包名
  --  p_procedure_name_insert  插入方法名
  --  p_procedure_name_update  更新方法名
  --  p_procedure_name_delete  删除方法名
  --  p_procedure_name_execute 执行方法名
  --==========================================================
  PROCEDURE print_bm(p_table_name             IN user_tables.table_name%TYPE,
                     p_package_name           IN user_procedures.object_name%TYPE DEFAULT NULL,
                     p_procedure_name_insert  IN user_procedures.procedure_name%TYPE DEFAULT NULL,
                     p_procedure_name_update  IN user_procedures.procedure_name%TYPE DEFAULT NULL,
                     p_procedure_name_delete  IN user_procedures.procedure_name%TYPE DEFAULT NULL,
                     p_procedure_name_execute IN user_procedures.procedure_name%TYPE DEFAULT NULL) IS
  
  BEGIN
    print_bm_field(p_table_name => p_table_name);
  
    IF p_package_name IS NOT NULL THEN
      print_bm_operation(p_table_name             => p_table_name,
                         p_package_name           => p_package_name,
                         p_procedure_name_insert  => p_procedure_name_insert,
                         p_procedure_name_update  => p_procedure_name_update,
                         p_procedure_name_delete  => p_procedure_name_delete,
                         p_procedure_name_execute => p_procedure_name_execute);
    END IF;
  END print_bm;

  --==========================================================
  --procedure name  : print_grid
  --description     : 输出表字段grid->column
  --note            : 
  --parameter       : 
  --  p_table_name           表名
  --==========================================================
  PROCEDURE print_grid(p_table_name IN user_tables.table_name%TYPE) IS
    v_table_name user_tables.table_name%TYPE;
  
    v_align VARCHAR2(30);
  BEGIN
    v_table_name := upper(p_table_name);
  
    p('<a:columns>');
    FOR v_rec IN (SELECT lower(c.column_name) AS column_name,
                         c.data_type,
                         cc.comments
                    FROM user_tab_columns  c,
                         user_col_comments cc
                   WHERE c.table_name = v_table_name
                     AND c.table_name = cc.table_name
                     AND cc.column_name = c.column_name
                   ORDER BY c.column_id ASC)
    LOOP
      IF v_rec.data_type = c_databasetype_number THEN
        v_align := c_align_right;
      ELSIF v_rec.data_type = c_databasetype_date THEN
        v_align := c_align_center;
      ELSIF v_rec.data_type = c_databasetype_varchar2 THEN
        v_align := c_align_left;
      ELSE
        v_align := c_align_left;
      END IF;
    
      p('<a:column name="' || v_rec.column_name || '" align="' || v_align || '" prompt="' || v_rec.comments || '" sortable="true" width="100"/>');
    END LOOP;
    p('</a:columns>');
  END print_grid;

  --==========================================================
  --procedure name  : get_dbscript_package
  --description     : 获取数据库脚本--包
  --note            : 
  --parameter       : 
  --  p_package_name                 包名
  --==========================================================
  FUNCTION get_dbscript_package(p_package_name IN user_procedures.object_name%TYPE) RETURN CLOB IS
    v_return CLOB;
  BEGIN
    FOR v_rec IN (SELECT us.text
                    FROM user_source us
                   WHERE us.name = p_package_name
                     AND us.type = c_object_type_package
                   ORDER BY us.line ASC)
    LOOP
      v_return := v_return || v_rec.text;
    END LOOP;
    v_return := v_return || '/' || chr(10);
  
    FOR v_rec IN (SELECT us.text
                    FROM user_source us
                   WHERE us.name = p_package_name
                     AND us.type = c_object_type_package_body
                   ORDER BY us.line ASC)
    LOOP
      v_return := v_return || v_rec.text;
    END LOOP;
    v_return := v_return || chr(10) || '/' || chr(10);
  
    RETURN v_return;
  END get_dbscript_package;

  --==========================================================
  --procedure name  : generate_dbscript_table
  --description     : 生成数据库脚本--表
  --note            : 
  --parameter       : 
  --==========================================================
  PROCEDURE generate_dbscript_table IS
  
  BEGIN
    FOR v_rec IN (SELECT jsd.script_id,
                         pkg.object_name
                    FROM (SELECT uo.object_name,
                                 MAX(uo.last_ddl_time) AS last_ddl_time
                            FROM user_objects uo
                           WHERE uo.object_type = c_object_type_table
                           GROUP BY uo.object_name) pkg,
                         js_sys_dbscript jsd
                   WHERE jsd.object_type = c_object_type_table
                     AND jsd.object_name = pkg.object_name
                     AND jsd.last_update_date < pkg.last_ddl_time)
    LOOP
      UPDATE js_sys_dbscript jsd
         SET jsd.script           = dbms_metadata.get_ddl(object_type => c_object_type_table, NAME => v_rec.object_name),
             jsd.last_updated_by  = 1,
             jsd.last_update_date = SYSDATE
       WHERE jsd.script_id = v_rec.script_id;
    END LOOP;
  
    INSERT INTO js_sys_dbscript
      SELECT 1,
             SYSDATE,
             1,
             SYSDATE,
             js_sys_dbscript_s.nextval,
             c_object_type_table,
             object_name,
             dbms_metadata.get_ddl(object_type => c_object_type_table, NAME => object_name)
        FROM (SELECT uo.object_name
                FROM user_objects uo
               WHERE uo.object_type = c_object_type_table
                 AND NOT EXISTS (SELECT 1
                        FROM js_sys_dbscript jsd
                       WHERE jsd.object_type = uo.object_type
                         AND jsd.object_name = uo.object_name));
  END generate_dbscript_table;

  --==========================================================
  --procedure name  : generate_dbscript_view
  --description     : 生成数据库脚本--视图
  --note            : 
  --parameter       : 
  --==========================================================
  PROCEDURE generate_dbscript_view IS
  
  BEGIN
    NULL;
  END generate_dbscript_view;

  --==========================================================
  --procedure name  : generate_dbscript_mview
  --description     : 生成数据库脚本--物化视图
  --note            : 
  --parameter       : 
  --==========================================================
  PROCEDURE generate_dbscript_mview IS
  
  BEGIN
    NULL;
  END generate_dbscript_mview;

  --==========================================================
  --procedure name  : generate_dbscript_sequence
  --description     : 生成数据库脚本--序列
  --note            : 
  --parameter       : 
  --==========================================================
  PROCEDURE generate_dbscript_sequence IS
  
  BEGIN
    NULL;
  END generate_dbscript_sequence;

  /*--==========================================================
  --procedure name  : generate_dbscript_package
  --description     : 生成数据库脚本--包
  --note            : 
  --parameter       : 
  --==========================================================
  PROCEDURE generate_dbscript_package IS
  
  BEGIN
    FOR v_rec IN (SELECT jsd.script_id,
                         pkg.object_name
                    FROM (SELECT uo.object_name,
                                 MAX(uo.last_ddl_time) AS last_ddl_time
                            FROM user_objects uo
                           WHERE uo.object_type IN (C_OBJECT_TYPE_PACKAGE,
                                                    C_OBJECT_TYPE_PACKAGE_BODY)
                           GROUP BY uo.object_name) pkg,
                         js_sys_dbscript jsd
                   WHERE jsd.object_type = C_OBJECT_TYPE_PACKAGE
                     AND jsd.object_name = pkg.object_name
                     AND jsd.last_update_date < pkg.last_ddl_time) LOOP
      UPDATE js_sys_dbscript jsd
         SET jsd.script           = dbms_metadata.get_ddl(object_type => C_OBJECT_TYPE_PACKAGE,
                                                          NAME        => v_rec.object_name),
             jsd.last_updated_by  = 1,
             jsd.last_update_date = SYSDATE
       WHERE jsd.script_id = v_rec.script_id;
    END LOOP;
  
    INSERT INTO js_sys_dbscript
      SELECT 1,
             SYSDATE,
             1,
             SYSDATE,
             js_sys_dbscript_s.nextval,
             C_OBJECT_TYPE_PACKAGE,
             object_name,
             dbms_metadata.get_ddl(object_type => C_OBJECT_TYPE_PACKAGE,
                                   NAME        => object_name)
        FROM (SELECT uo.object_name
                FROM user_objects uo
               WHERE uo.object_type = C_OBJECT_TYPE_PACKAGE
                 AND NOT EXISTS (SELECT 1
                        FROM js_sys_dbscript jsd
                       WHERE jsd.object_type = uo.object_type
                         AND jsd.object_name = uo.object_name));
  END generate_dbscript_package;*/

  --==========================================================
  --procedure name  : generate_dbscript_package
  --description     : 生成数据库脚本--包
  --note            : 
  --parameter       : 
  --==========================================================
  PROCEDURE generate_dbscript_package IS
    v_js_sys_dbscript js_sys_dbscript%ROWTYPE;
    v_script          CLOB;
  BEGIN
    FOR v_rec IN (SELECT jsd.script_id,
                         pkg.object_name
                    FROM (SELECT uo.object_name,
                                 MAX(uo.last_ddl_time) AS last_ddl_time
                            FROM user_objects uo
                           WHERE uo.object_type IN (c_object_type_package, c_object_type_package_body)
                           GROUP BY uo.object_name) pkg,
                         js_sys_dbscript jsd
                   WHERE jsd.object_type = c_object_type_package
                     AND jsd.object_name = pkg.object_name
                     AND jsd.last_update_date < pkg.last_ddl_time)
    LOOP
      v_script := get_dbscript_package(p_package_name => v_rec.object_name);
      UPDATE js_sys_dbscript jsd
         SET jsd.script           = v_script,
             jsd.last_updated_by  = 1,
             jsd.last_update_date = SYSDATE
       WHERE jsd.script_id = v_rec.script_id;
    END LOOP;
  
    FOR v_rec IN (SELECT uo.object_name
                    FROM user_objects uo
                   WHERE uo.object_type = c_object_type_package
                     AND NOT EXISTS (SELECT 1
                            FROM js_sys_dbscript jsd
                           WHERE jsd.object_type = uo.object_type
                             AND jsd.object_name = uo.object_name))
    LOOP
      v_js_sys_dbscript.created_by       := 1;
      v_js_sys_dbscript.creation_date    := SYSDATE;
      v_js_sys_dbscript.last_updated_by  := 1;
      v_js_sys_dbscript.last_update_date := SYSDATE;
    
      SELECT js_sys_dbscript_s.nextval
        INTO v_js_sys_dbscript.script_id
        FROM dual;
      v_js_sys_dbscript.object_type := c_object_type_package;
      v_js_sys_dbscript.object_name := v_rec.object_name;
      v_js_sys_dbscript.script      := get_dbscript_package(p_package_name => v_rec.object_name);
    
      INSERT INTO js_sys_dbscript
      VALUES v_js_sys_dbscript;
    END LOOP;
  END generate_dbscript_package;

  --==========================================================
  --procedure name  : generate_dbscript
  --description     : 生成数据库脚本
  --note            : 
  --parameter       : 
  --==========================================================
  PROCEDURE generate_dbscript IS
  
  BEGIN
    /*dbms_metadata.set_transform_param(transform_handle => dbms_metadata.SESSION_TRANSFORM,
                                      NAME             => 'STORAGE',
                                      VALUE            => FALSE);
    dbms_metadata.set_transform_param(transform_handle => dbms_metadata.SESSION_TRANSFORM,
                                      NAME             => 'TABLESPACE',
                                      VALUE            => FALSE);
    dbms_metadata.set_transform_param(transform_handle => dbms_metadata.SESSION_TRANSFORM,
                                      NAME             => 'PRETTY',
                                      VALUE            => TRUE);
    dbms_metadata.set_transform_param(transform_handle => dbms_metadata.SESSION_TRANSFORM,
                                      NAME             => 'SQLTERMINATOR',
                                      VALUE            => TRUE);
    dbms_metadata.set_transform_param(transform_handle => dbms_metadata.SESSION_TRANSFORM,
                                      NAME             => 'SEGMENT_ATTRIBUTES',
                                      VALUE            => FALSE);*/
  
    generate_dbscript_package;
    --generate_dbscript_table;
  END generate_dbscript;

  --==========================================================
  --procedure name  : generate_script_function
  --description     : 生成功能注册脚本
  --note            : 
  --parameter       : 
  --==========================================================
  PROCEDURE generate_script_function IS
    v_file   utl_file.file_type;
    v_buffer VARCHAR2(32767);
  
    v_sys_parent_function sys_function_vl%ROWTYPE;
    v_sys_service         sys_service%ROWTYPE;
  BEGIN
    FOR v_function IN (SELECT sfv.function_id,
                              sfv.function_code,
                              sfv.function_description AS function_desc,
                              sfv.parent_function_id,
                              sfv.function_level,
                              sfv.service_id,
                              sfv.sequence,
                              userenv('lang') AS LANGUAGE,
                              'INSTALL_' || sfv.function_code || '.sql' AS file_name
                         FROM sys_function_vl sfv
                        ORDER BY sfv.function_code ASC)
    LOOP
      BEGIN
        utl_file.fremove(location => c_location_dataload_script, filename => v_function.file_name);
      EXCEPTION
        WHEN OTHERS THEN
          NULL;
      END;
    
      v_file := utl_file.fopen(location => c_location_dataload_script, filename => v_function.file_name, open_mode => 'W', max_linesize => 32767);
    
      w_header(p_file => v_file, p_spool_log => 'INSTALL_' || v_function.function_code || '.log');
    
      w(v_file, 'begin');
    
      w(v_file, '--页面注册');
      FOR v_service IN (SELECT ss.service_name,
                               ss.title,
                               ss.is_access_checked,
                               ss.is_login_required,
                               ss.is_system_access
                          FROM sys_function_service sfs,
                               sys_service          ss
                         WHERE sfs.function_id = v_function.function_id
                           AND sfs.service_id = ss.service_id
                         ORDER BY ss.service_name ASC)
      LOOP
        w(v_file,
          'sys_data_load_pkg.load_sys_service(' || '''' || v_service.service_name || '''' || ',' || '''' || v_service.title || '''' || ',' || v_service.is_access_checked || ',' ||
          v_service.is_login_required || ',' || v_service.is_system_access || ');');
      END LOOP;
      w(v_file, '');
    
      w(v_file, '--功能定义');
      FOR v_function_tree IN (SELECT sfv2.function_id,
                                     sfv2.function_code,
                                     sfv2.function_name,
                                     sfv2.function_description AS function_desc,
                                     sfv2.parent_function_id,
                                     sfv2.function_camp,
                                     sfv2.function_type,
                                     sfv2.function_level,
                                     sfv2.service_id,
                                     sfv2.sequence
                                FROM sys_function_vl sfv2
                               START WITH sfv2.function_id = v_function.function_id
                              CONNECT BY PRIOR sfv2.parent_function_id = sfv2.function_id
                               ORDER BY LEVEL DESC)
      LOOP
        IF v_function_tree.function_level = 'G' THEN
          w(v_file,
            'sys_data_load_pkg.load_sys_function(' || '''' || v_function_tree.function_code || '''' || ',' || '''' || v_function_tree.function_name || '''' || ',' || '''' ||
            v_function_tree.function_desc || '''' || ',' || '''' || '''' || ',' || '''' || v_function_tree.function_level || '''' || ',' || '''' || '''' || ',' || '''' || '''' || ',' || '''' || '''' || ',' || '''' ||
            v_function_tree.sequence || '''' || ',' || '''' || '''' || ',' || '''' || '''' || ');');
        ELSIF v_function_tree.function_level = 'F' THEN
          BEGIN
            IF v_function.parent_function_id IS NOT NULL THEN
              SELECT sfv3.*
                INTO v_sys_parent_function
                FROM sys_function_vl sfv3
               WHERE sfv3.function_id = v_function_tree.parent_function_id;
            END IF;
          EXCEPTION
            WHEN no_data_found THEN
              NULL;
          END;
          BEGIN
            IF v_function.service_id IS NOT NULL THEN
              SELECT ss.*
                INTO v_sys_service
                FROM sys_service ss
               WHERE ss.service_id = v_function_tree.service_id;
            END IF;
          EXCEPTION
            WHEN no_data_found THEN
              NULL;
          END;
        
          w(v_file,
            'sys_data_load_pkg.load_sys_function(' || '''' || v_function_tree.function_code || '''' || ',' || '''' || v_function_tree.function_name || '''' || ',' || '''' ||
            v_function_tree.function_desc || '''' || ',' || '''' || v_sys_parent_function.function_code || '''' || ',' || '''' || v_function_tree.function_level || '''' || ',' || '''' ||
            v_function_tree.function_camp || '''' || ',' || '''' || v_function_tree.function_type || '''' || ',' || '''' || v_sys_service.service_name || '''' || ',' || '''' ||
            v_function_tree.sequence || '''' || ',' || '''' || '''' || ',' || '''' || '''' || ');');
        END IF;
      END LOOP;
      w(v_file, '');
    
      w(v_file, '--分配页面');
      BEGIN
        IF v_function.service_id IS NOT NULL THEN
          SELECT ss.*
            INTO v_sys_service
            FROM sys_service ss
           WHERE ss.service_id = v_function.service_id;
        END IF;
      EXCEPTION
        WHEN no_data_found THEN
          NULL;
      END;
      FOR v_service IN (SELECT ss.service_name
                          FROM sys_function_service sfs,
                               sys_service          ss
                         WHERE sfs.function_id = v_function.function_id
                           AND sfs.service_id = ss.service_id
                         ORDER BY ss.service_name ASC)
      LOOP
        w(v_file, 'sys_data_load_pkg.load_function_service(' || '''' || v_sys_service.service_name || '''' || ',' || '''' || v_service.service_name || '''' || ');');
      END LOOP;
      w(v_file, '');
    
      w(v_file, '--分配BM');
      FOR v_bm IN (SELECT sfba.bm_name
                     FROM sys_function_bm_access sfba
                    WHERE sfba.function_id = v_function.function_id
                    ORDER BY sfba.bm_name ASC)
      LOOP
        w(v_file, 'sys_data_load_pkg.load_function_bm(' || '''' || v_sys_service.service_name || '''' || ',' || '''' || v_bm.bm_name || '''' || ');');
      END LOOP;
      w(v_file, '');
    
      w(v_file, 'end;');
    
      w_footer(p_file => v_file);
    
      utl_file.fclose(file => v_file);
    END LOOP;
  END generate_script_function;

  --==========================================================
  --procedure name  : generate_script_syscode
  --description     : 生成SYSCODE脚本
  --note            : 
  --parameter       : 
  --==========================================================
  PROCEDURE generate_script_syscode IS
    v_file   utl_file.file_type;
    v_buffer VARCHAR2(32767);
  
  BEGIN
    FOR v_code IN (SELECT scv.code_id,
                          scv.code,
                          scv.code_name,
                          scv.code_prompt,
                          scv.code_name_prompt,
                          userenv('lang') AS LANGUAGE,
                          scv.sys_flag,
                          'INITIALIZE_SYSCODE_' || scv.code || '.sql' AS file_name
                     FROM sys_codes_vl scv
                    WHERE scv.enabled_flag = 'Y')
    LOOP
      BEGIN
        utl_file.fremove(location => c_location_dataload_script, filename => v_code.file_name);
      EXCEPTION
        WHEN OTHERS THEN
          NULL;
      END;
    
      v_file := utl_file.fopen(location => c_location_dataload_script, filename => v_code.file_name, open_mode => 'W', max_linesize => 32767);
    
      w_header(p_file => v_file, p_spool_log => 'INITIALIZE_SYSCODE_' || v_code.code || '.log');
    
      w(v_file, 'begin');
    
      w(v_file, 'sys_code_pkg.delete_sys_code(' || '''' || v_code.code || '''' || ');');
      IF v_code.sys_flag = 'Y' THEN
        w(v_file,
          'sys_code_pkg.insert_sys_code(' || '''' || v_code.code || '''' || ',' || '''' || v_code.code_name || '''' || ',' || '''' || v_code.code_prompt || '''' || ',' || '''' ||
          v_code.code_name_prompt || '''' || ',' || '''' || v_code.language || '''' || ');');
      ELSE
        w(v_file,
          'sys_code_pkg.insert_sys_code(' || '''' || v_code.code || '''' || ',' || '''' || v_code.code_name || '''' || ',' || '''' || v_code.code_prompt || '''' || ',' || '''' ||
          v_code.code_name_prompt || '''' || ',' || '''' || '' || '''' || ',' || '''' || v_code.sys_flag || '''' || ',' || '''' || v_code.language || '''' || ');');
      END IF;
      w(v_file, '');
    
      FOR v_code_value IN (SELECT scvv.code_value_id,
                                  scvv.code_value,
                                  scvv.code_value_name,
                                  userenv('lang') AS LANGUAGE
                             FROM sys_code_values_vl scvv
                            WHERE scvv.code_id = v_code.code_id
                              AND scvv.enabled_flag = 'Y')
      LOOP
        w(v_file,
          'sys_code_pkg.insert_sys_code_value(' || '''' || v_code.code || '''' || ',' || '''' || v_code_value.code_value || '''' || ',' || '''' || v_code_value.code_value_name || '''' || ',' || '''' ||
          v_code_value.language || '''' || ');');
      END LOOP;
    
      w(v_file, 'end;');
    
      w_footer(p_file => v_file);
    
      utl_file.fclose(file => v_file);
    END LOOP;
  END generate_script_syscode;

  --==========================================================
  --procedure name  : print_script_syscode
  --description     : 输出SYSCODE脚本
  --note            : 
  --parameter       : 
  --  p_syscode            系统代码    
  --==========================================================
  PROCEDURE print_script_syscode(p_syscode IN VARCHAR2 DEFAULT NULL) IS
  
  BEGIN
    IF p_syscode IS NOT NULL THEN
      FOR v_code IN (SELECT scv.code_id,
                            scv.code,
                            scv.code_name,
                            scv.code_prompt,
                            scv.code_name_prompt,
                            userenv('lang') AS LANGUAGE,
                            scv.sys_flag,
                            'INITIALIZE_SYSCODE_' || scv.code || '.sql' AS file_name
                       FROM sys_codes_vl scv
                      WHERE scv.enabled_flag = 'Y'
                        AND scv.code = p_syscode)
      LOOP
      
        p('begin');
      
        p('sys_code_pkg.delete_sys_code(' || '''' || v_code.code || '''' || ');');
        IF v_code.sys_flag = 'Y' THEN
          p('sys_code_pkg.insert_sys_code(' || '''' || v_code.code || '''' || ',' || '''' || v_code.code_name || '''' || ',' || '''' || v_code.code_prompt || '''' || ',' || '''' ||
            v_code.code_name_prompt || '''' || ',' || '''' || v_code.language || '''' || ');');
        ELSE
          p('sys_code_pkg.insert_sys_code(' || '''' || v_code.code || '''' || ',' || '''' || v_code.code_name || '''' || ',' || '''' || v_code.code_prompt || '''' || ',' || '''' ||
            v_code.code_name_prompt || '''' || ',' || '''' || v_code.language || '''' || ',' || '''' || '' || '''' || ',' || '''' || v_code.sys_flag || '''' || ');');
        END IF;
        p('');
      
        FOR v_code_value IN (SELECT scvv.code_value_id,
                                    scvv.code_value,
                                    scvv.code_value_name,
                                    userenv('lang') AS LANGUAGE
                               FROM sys_code_values_vl scvv
                              WHERE scvv.code_id = v_code.code_id
                                AND scvv.enabled_flag = 'Y')
        LOOP
          p('sys_code_pkg.insert_sys_code_value(' || '''' || v_code.code || '''' || ',' || '''' || v_code_value.code_value || '''' || ',' || '''' || v_code_value.code_value_name || '''' || ',' || '''' ||
            v_code_value.language || '''' || ');');
        END LOOP;
      
        p('end;');
      END LOOP;
    ELSE
      NULL;
    END IF;
  END print_script_syscode;

  --==========================================================
  --procedure name  : print_script_sysprompt
  --description     : 输出SYSPROMPT脚本
  --note            : add by wanghaitao at 2014-04-24 
  --parameter       : 
  --  p_prompt_code 描述代码 
  --  p_zhs_description 中文描述
  --  p_us_description 英文描述
  --  p_need_begin 是否需要begin
  --==========================================================
  PROCEDURE print_script_sysprompt(p_prompt_code     IN VARCHAR2,
                                   p_zhs_description IN VARCHAR2,
                                   p_us_description  IN VARCHAR2,
                                   p_need_begin      IN BOOLEAN DEFAULT FALSE) IS
  BEGIN
    IF p_prompt_code IS NOT NULL THEN
      IF p_need_begin THEN
        p('begin');
      END IF;
      p('sys_prompt_pkg.sys_prompts_load(''' || upper(p_prompt_code) || ''',''ZHS'',''' || p_zhs_description || ''');');
      p('sys_prompt_pkg.sys_prompts_load(''' || upper(p_prompt_code) || ''',''US'',''' || p_us_description || ''');');
      IF p_need_begin THEN
        p('end;');
      END IF;
      p('');
    END IF;
  END print_script_sysprompt;

  --==========================================================
  --procedure name  : print_script_sysmessage
  --description     : 输出SYSMESSAGE脚本
  --note            : add by wanghaitao at 2014-04-24 
  --parameter       : 
  --  p_message_code 消息代码 
  --  p_zhs_description 中文描述
  --  p_us_description 英文描述
  --  p_need_begin 是否需要begin
  --==========================================================
  PROCEDURE print_script_sysmessage(p_message_code    IN VARCHAR2,
                                    p_zhs_description IN VARCHAR2,
                                    p_us_description  IN VARCHAR2,
                                    p_need_begin      IN BOOLEAN DEFAULT TRUE) IS
  BEGIN
    IF p_message_code IS NOT NULL THEN
      IF p_need_begin THEN
        p('begin');
      END IF;
      p('sys_message_pkg.delete_message(''' || upper(p_message_code) || ''');');
      p('sys_message_pkg.insert_message(''' || upper(p_message_code) || ''',''错误'',''' || p_zhs_description || ''',''ZHS'');');
      p('sys_message_pkg.insert_message(''' || upper(p_message_code) || ''',''ERROR'',''' || p_us_description || ''',''US'');');
      IF p_need_begin THEN
        p('end;');
      END IF;
      p('');
    END IF;
  END print_script_sysmessage;

  --==========================================================
  --procedure name  : print_table_query
  --description     : 输出table的Query脚本
  --note            : add by wanghaitao at 2014-10-09 
  --parameter       : 
  --  p_table_name 表名
  --==========================================================
  PROCEDURE print_table_query(p_table_name IN VARCHAR2) IS
  BEGIN
    p('select ');
    FOR f IN (SELECT 't.' || lower(tc.column_name) || ',' AS column_name
                FROM user_tab_columns tc
               WHERE tc.table_name = upper(p_table_name)
               ORDER BY tc.column_id)
    LOOP
      p(f.column_name);
    END LOOP;
    p(' from ' || p_table_name || ';');
  END print_table_query;

  --==========================================================
  --procedure name  : print_ws_xmlformat_para
  --description     : 输出table的xml节点脚本
  --note            : add by chengwenzhe at 2016-8-29 
  --parameter       : 
  --  p_table_name 表名
  --==========================================================
  PROCEDURE print_ws_xmlformat_para(p_table_name IN VARCHAR2) IS
    v_tab  VARCHAR2(100) := '    ';
    v_tab2 VARCHAR2(100) := '           ';
  BEGIN
    p('<' || upper(p_table_name) || '>');
    p(v_tab || '<RECORD>');
    FOR v IN (SELECT *
                FROM user_tab_columns c
               WHERE c.table_name = upper(p_table_name)
               ORDER BY c.column_id ASC)
    LOOP
      p(v_tab2 || '<' || upper(v.column_name) || '><![CDATA[1]]></' || upper(v.column_name) || '>');
    END LOOP;
    p(v_tab || '</RECORD>');
    p('</' || upper(p_table_name) || '>');
  END print_ws_xmlformat_para;

  PROCEDURE print_package_invoke(p_package_name VARCHAR2,
                                 p_object_name  VARCHAR2) IS
    v_text CLOB := p_package_name || '.' || p_object_name || '(';
  BEGIN
    FOR args_rec IN (SELECT t.object_name,
                            t.package_name,
                            t.argument_name
                       FROM user_arguments t
                      WHERE t.package_name = upper(p_package_name)
                        AND t.object_name = upper(p_object_name))
    LOOP
      v_text := v_text || args_rec.argument_name || ' => ' || args_rec.argument_name || ',';
    
    END LOOP;
    v_text := TRIM(',' FROM v_text);
    v_text := v_text || ');';
    dbms_output.put_line(v_text);
  
  END print_package_invoke;

  PROCEDURE print_xml_by_procedure(p_package_name   IN user_procedures.object_name%TYPE,
                                   p_procedure_name IN user_procedures.procedure_name%TYPE) IS
  
  BEGIN
  
    FOR v_rec IN (SELECT ua.argument_name,
                         ua.data_type,
                         ua.in_out
                    FROM user_arguments ua
                   WHERE ua.package_name = upper(p_package_name)
                     AND ua.object_name = upper(p_procedure_name)
                   ORDER BY ua.sequence ASC)
    LOOP
      --  '<' || substr(upper(v_rec.argument_name),3) || '><![CDATA[1]]></' || substr(upper(v.argument_name),3) || '>'
    
      p('                  ' || '<' || substr(upper(v_rec.argument_name), 3) || '><![CDATA[1]]></' || substr(upper(v_rec.argument_name), 3) || '>');
    END LOOP;
  END print_xml_by_procedure;
  --==========================================================
  -- ProcedureName   : create_table_es
  -- Description     : 创建映射表
  -- Note            :
  -- Parameter       :
  -- p_table_name  创建映射表
  --==========================================================
  PROCEDURE create_tabel_es(p_table_name         VARCHAR2,
                            p_srm_pk_column_name VARCHAR2,
                            p_es_column_name1    VARCHAR2,
                            p_es_column_name2    IN VARCHAR2 DEFAULT NULL,
                            p_es_column_name3    IN VARCHAR2 DEFAULT NULL -- 暂时无用
                            ) IS
    v_es_str1     CLOB := '-- Create table' || '
CREATE TABLE ' || c_table_name || '_ES
(
  ' || upper(substr(c_table_name, 0, 7)) || '_ES_ID       NUMBER NOT NULL,
' || upper(p_srm_pk_column_name) || '     NUMBER NOT NULL,
  BUSINESS_GROUP      VARCHAR2(30) NOT NULL,
  ES_ID               NUMBER NOT NULL,' || chr(10);
    v_es_str2     CLOB;
    v_es_str3     CLOB;
    v_es_str4     CLOB;
    v_es_str_temp CLOB;
    v_es_str      CLOB;
    v_count_exist NUMBER;
  BEGIN
  
    FOR rec IN (SELECT *
                  FROM user_tab_cols t
                 WHERE t.table_name = p_table_name
                   AND (t.column_name = p_es_column_name1 OR ((p_es_column_name2 IS NULL AND t.column_name IS NULL) OR t.column_name = p_es_column_name2) OR
                       ((p_es_column_name3 IS NULL AND t.column_name IS NULL) OR t.column_name = p_es_column_name3)))
    LOOP
      IF rec.data_type = 'VARCHAR2' THEN
        v_es_str2 := '  ES_' || rec.column_name || '       ' || rec.data_type || '(' || to_char(rec.data_length + 10) || '),' || chr(10);
      ELSE
        v_es_str2 := '  ES_' || rec.column_name || '       ' || rec.data_type || ',' || chr(10);
      END IF;
      v_es_str3 := v_es_str3 || v_es_str2;
    END LOOP;
    --
    IF p_es_column_name2 IS NULL THEN
      v_es_str_temp := '';
    ELSE
      v_es_str_temp := ',ES_' || p_es_column_name2;
    END IF;
    --
    --
    v_es_str4 := '  CREATED_BY          NUMBER NOT NULL,
  CREATION_DATE        DATE NOT NULL,
  LAST_UPDATE_DATE    DATE NOT NULL,
  LAST_UPDATED_BY     NUMBER NOT NULL,
  DATA_VERSION        NUMBER DEFAULT 0,
  LAST_UPDATE_VERSION NUMBER DEFAULT 0
)
' || c_srm_table_space || '
ALTER TABLE ' || c_table_name || '_ES
  ADD CONSTRAINT ' || c_table_name || '_ES_PK PRIMARY KEY (' || upper(substr(c_table_name, 0, 7)) || '_ES_ID);
--Create/Recreate indexes 
CREATE INDEX ' || c_table_name || '_ES_N1 ON ' || c_table_name || '_ES (BUSINESS_GROUP, ES_ID);
CREATE UNIQUE INDEX ' || c_table_name || '_ES_U1 ON ' || c_table_name || '_ES (' || p_srm_pk_column_name || ')' || chr(10) || c_srm_table_space || '
CREATE UNIQUE INDEX ' || c_table_name || '_ES_U2 ON ' || c_table_name || '_ES (ES_ID, ES_' || p_es_column_name1 || v_es_str_temp || ')' || c_srm_table_space || '
 create sequence ' || lower(c_table_name) || '_es_s increment by 1 start with 1;   
    ';
  
    v_es_str := v_es_str1 || v_es_str3 || v_es_str4;
    --插入记录表
    BEGIN
      SELECT COUNT(1)
        INTO v_count_exist
        FROM itf_interface_sql_cht t
       WHERE t.table_name = c_table_name;
    END;
    IF v_count_exist = 0 THEN
      --插入记录表
      INSERT INTO itf_interface_sql_cht
        (table_name,
         table_es)
      VALUES
        (c_table_name,
         v_es_str);
    ELSE
      UPDATE itf_interface_sql_cht t
         SET t.table_es = v_es_str
       WHERE t.table_name = c_table_name;
    END IF;
  END;
  --==========================================================
  -- ProcedureName   : create_eitf_table
  -- Description     : 创建中间表
  -- Note            :
  -- Parameter       :
  -- p_table_name  业务表名
  --==========================================================
  PROCEDURE create_eitf_table(p_table_name VARCHAR2) IS
    v_eitf_str1   CLOB := '-- Create table' || '
CREATE TABLE EITF_' || c_table_name || '
(
  EITF_HEADER_ID           NUMBER NOT NULL,
  EITF_INSTANCE_ID         NUMBER NOT NULL,
  ERP_LAST_UPDATE_DATE     VARCHAR2(30),
  ERP_LAST_UPDATED_BY      VARCHAR2(30),
  ERP_LAST_UPDATE_LOGIN    VARCHAR2(30),
  ERP_CREATION_DATE        VARCHAR2(30),
  ERP_CREATED_BY           VARCHAR2(30),' || chr(10);
    v_eitf_str2   CLOB;
    v_eitf_str3   CLOB;
    v_eitf_str4   CLOB := '  C_ATTRIBUTE1              VARCHAR2(150),
  C_ATTRIBUTE2               VARCHAR2(150),
  C_ATTRIBUTE3               VARCHAR2(150),
  C_ATTRIBUTE4               VARCHAR2(150),
  C_ATTRIBUTE5               VARCHAR2(150),
  C_ATTRIBUTE6               VARCHAR2(150),
  C_ATTRIBUTE7               VARCHAR2(150),
  C_ATTRIBUTE8               VARCHAR2(150),
  C_ATTRIBUTE9               VARCHAR2(150),
  C_ATTRIBUTE10              VARCHAR2(150),
  C_ATTRIBUTE11              VARCHAR2(150),
  C_ATTRIBUTE12              VARCHAR2(150),
  C_ATTRIBUTE13              VARCHAR2(150),
  C_ATTRIBUTE14              VARCHAR2(150),
  C_ATTRIBUTE15              VARCHAR2(150),
  CREATED_BY               NUMBER NOT NULL,
  CREATION_DATE            DATE NOT NULL,
  LAST_UPDATED_BY          NUMBER NOT NULL,
  LAST_UPDATE_DATE         DATE NOT NULL
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table EITF_' || c_table_name || '
  add constraint EITF_' || c_table_name || '_PK primary key (eitf_header_id);
  create index EITF_' || c_table_name || '_N1 on EITF_' || c_table_name || ' (EITF_INSTANCE_ID);
create sequence eitf_' || lower(c_table_name) || '_s increment by 1 start with 1';
    v_eitf_str    CLOB;
    v_count_exist NUMBER;
  BEGIN
  
    FOR rec IN (SELECT *
                  FROM user_tab_cols t
                 WHERE t.table_name = p_table_name
                   AND t.column_name NOT IN ('CREATION_DATE', 'CREATED_BY', 'LAST_UPDATE_DATE', 'LAST_UPDATED_BY')
                   AND t.column_name NOT LIKE '%GLOBAL_%ATTRIBUTE%'
                   AND t.column_name NOT LIKE '%ATTRIBUTE%')
    LOOP
      IF rec.data_type = 'VARCHAR2' THEN
        v_eitf_str2 := '  ' || rec.column_name || '       ' || rec.data_type || '(' || to_char(rec.data_length + 10) || '),' || chr(10);
      ELSE
        v_eitf_str2 := '  ' || rec.column_name || '       VARCHAR2(30),' || chr(10);
      END IF;
      v_eitf_str3 := v_eitf_str3 || v_eitf_str2;
    END LOOP;
    v_eitf_str := v_eitf_str1 || v_eitf_str3 || v_eitf_str4;
    BEGIN
      SELECT COUNT(1)
        INTO v_count_exist
        FROM itf_interface_sql_cht t
       WHERE t.table_name = c_table_name;
    
    END;
    IF v_count_exist = 0 THEN
      --插入记录表
      INSERT INTO itf_interface_sql_cht
        (table_name,
         eitf_table_text)
      VALUES
        (c_table_name,
         v_eitf_str);
    ELSE
      UPDATE itf_interface_sql_cht t
         SET t.eitf_table_text = v_eitf_str
      
       WHERE t.table_name = c_table_name;
    
    END IF;
  END;
  --==========================================================
  -- ProcedureName   : create_itf_table
  -- Description     : 创建接口表
  -- Note            :
  -- Parameter       :
  -- p_table_name  业务表名
  --==========================================================  
  PROCEDURE create_itf_table(p_table_name VARCHAR2) IS
    v_eitf_str1   CLOB := '-- Create table' || '
CREATE TABLE ITF_' || c_table_name || '
(
  ITF_HEADER_ID         NUMBER NOT NULL,
  BUSINESS_GROUP        VARCHAR2(30) NOT NULL,
  EXTERNAL_SYSTEM_CODE  VARCHAR2(30) NOT NULL,
  SEG_NUM               NUMBER,
  ITF_INSTANCE_ID       NUMBER,
  STATUS                VARCHAR2(30) NOT NULL,
  FINISHED_FLAG         VARCHAR2(1) DEFAULT ''N'' NOT NULL,
  ERROR_FLAG            VARCHAR2(1) DEFAULT ''N'' NOT NULL,
  MESSAGE_TEXT          VARCHAR2(4000),
  ERP_LAST_UPDATE_DATE  VARCHAR2(30),
  ERP_LAST_UPDATED_BY   VARCHAR2(30),
  ERP_LAST_UPDATE_LOGIN VARCHAR2(30),
  ERP_CREATION_DATE     VARCHAR2(30),
  ERP_CREATED_BY        VARCHAR2(30),' || chr(10);
    v_eitf_str2   CLOB;
    v_eitf_str3   CLOB;
    v_eitf_str4   CLOB := '  C_ATTRIBUTE1               VARCHAR2(150),
  C_ATTRIBUTE2               VARCHAR2(150),
  C_ATTRIBUTE3               VARCHAR2(150),
  C_ATTRIBUTE4               VARCHAR2(150),
  C_ATTRIBUTE5               VARCHAR2(150),
  C_ATTRIBUTE6               VARCHAR2(150),
  C_ATTRIBUTE7               VARCHAR2(150),
  C_ATTRIBUTE8               VARCHAR2(150),
  C_ATTRIBUTE9               VARCHAR2(150),
  C_ATTRIBUTE10              VARCHAR2(150),
  C_ATTRIBUTE11              VARCHAR2(150),
  C_ATTRIBUTE12              VARCHAR2(150),
  C_ATTRIBUTE13              VARCHAR2(150),
  C_ATTRIBUTE14              VARCHAR2(150),
  C_ATTRIBUTE15              VARCHAR2(150),
  ERROR_TYPE               VARCHAR2(30),
  ERROR_TIMES              NUMBER DEFAULT 0 NOT NULL,
  CREATED_BY               NUMBER NOT NULL,
  CREATION_DATE            DATE NOT NULL,
  LAST_UPDATED_BY          NUMBER NOT NULL,
  LAST_UPDATE_DATE         DATE NOT NULL
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ITF_' || c_table_name || '
  add constraint ITF_' || c_table_name || '_PK primary key (ITF_HEADER_ID);
create index ITF_' || c_table_name || '_N1 on ITF_' || c_table_name || ' (BUSINESS_GROUP, EXTERNAL_SYSTEM_CODE);
create index ITF_' || c_table_name || '_N2 on ITF_' || c_table_name || ' (ITF_INSTANCE_ID);
create index ITF_' || c_table_name || '_N3 on ITF_' || c_table_name || ' (STATUS);
create index ITF_' || c_table_name || '_N4 on ITF_' || c_table_name || ' (FINISHED_FLAG);
create index ITF_' || c_table_name || '_N5 on ITF_' || c_table_name || ' (ERROR_FLAG);
create sequence itf_' || lower(c_table_name) || '_s increment by 1 start with 1;';
    v_eitf_str    CLOB;
    v_count_exist NUMBER;
  BEGIN
  
    FOR rec IN (SELECT *
                  FROM user_tab_cols t
                 WHERE t.table_name = p_table_name
                   AND t.column_name NOT IN ('CREATION_DATE', 'CREATED_BY', 'LAST_UPDATE_DATE', 'LAST_UPDATED_BY')
                   AND t.column_name NOT LIKE '%GLOBAL_%ATTRIBUTE%'
                   AND t.column_name NOT LIKE '%ATTRIBUTE%')
    LOOP
      IF rec.data_type = 'VARCHAR2' THEN
        v_eitf_str2 := '  ' || rec.column_name || '       ' || rec.data_type || '(' || to_char(rec.data_length + 10) || '),' || chr(10);
      ELSE
        v_eitf_str2 := '  ' || rec.column_name || '       ' || rec.data_type || ',' || chr(10);
      END IF;
      v_eitf_str3 := v_eitf_str3 || v_eitf_str2;
    END LOOP;
    v_eitf_str := v_eitf_str1 || v_eitf_str3 || v_eitf_str4;
    --插入记录表
    BEGIN
      SELECT COUNT(1)
        INTO v_count_exist
        FROM itf_interface_sql_cht t
       WHERE t.table_name = c_table_name;
    
    END;
    IF v_count_exist = 0 THEN
      --插入记录表
      INSERT INTO itf_interface_sql_cht
        (table_name,
         itf_table_text)
      VALUES
        (c_table_name,
         v_eitf_str);
    ELSE
      UPDATE itf_interface_sql_cht t
         SET t.itf_table_text = v_eitf_str
      
       WHERE t.table_name = c_table_name;
    
    END IF;
  END;
  --==========================================================
  -- ProcedureName   : create_itf_table
  -- Description     : 创建PKG语句
  -- Note            :
  -- Parameter       :
  -- p_table_name  业务表名
  --==========================================================  
  PROCEDURE create_srm_pkg(p_table_name VARCHAR2) IS
    srm_final_str CLOB;
    srm_str4_temp CLOB;
    srm_str4      CLOB;
    srm_str3_temp CLOB;
    srm_str3      CLOB;
    srm_str2_temp CLOB;
    srm_str2      CLOB;
    srm_str1_temp CLOB;
    srm_str1      CLOB;
    srm_str0_temp CLOB;
    srm_str0      CLOB;
    str0          CLOB;
    str_temp      CLOB;
    str1          CLOB;
    str2          CLOB;
    str3          CLOB;
    str4          CLOB;
    str5          CLOB;
    str6          CLOB;
    str7          CLOB;
    str8          CLOB;
    str           CLOB;
    str_temp_4    CLOB;
    str_temp_7    CLOB;
    final_str     CLOB;
    v_count_exist NUMBER;
  BEGIN
    srm_str4 := 'CREATE OR REPLACE PACKAGE BODY itf_' || c_table_name || '_pkg IS
    c_pkg_name CONSTANT VARCHAR2(30) := ''itf_' || c_table_name || '_pkg'';
    e_aurora_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_aurora_exception,
                          -20000);
  
    PROCEDURE save_' || c_table_name || '
    (
      x_header_id            OUT NUMBER,
      p_business_group        VARCHAR2,
      p_external_system_id    NUMBER,
      p_erp_last_updated_by   IN NUMBER,
      p_erp_last_update_date  IN DATE,
      p_erp_last_update_login IN NUMBER,
      p_erp_created_by        IN NUMBER,
      p_erp_creation_date     IN DATE,';
  
    FOR rec_table IN (SELECT *
                        FROM user_tab_cols t
                       WHERE t.table_name = p_table_name
                         AND t.column_name NOT IN ('CREATION_DATE', 'CREATED_BY', 'LAST_UPDATE_DATE', 'LAST_UPDATED_BY'))
    LOOP
      srm_str3_temp := 'p_' || TRIM(rec_table.column_name) || '     ' || 'IN ' || TRIM(rec_table.data_type) || ' ,';
      srm_str3      := srm_str3 || srm_str3_temp;
    END LOOP;
  
    srm_str2 := '
    p_c_ATTRIBUTE1  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE2  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE3  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE4  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE5  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE6  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE7  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE8  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE9  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE10 IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE11 IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE12 IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE13 IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE14 IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE15 IN VARCHAR2 DEFAULT NULL,     
      p_user_id IN NUMBER
    ) IS
     
    BEGIN
    
   
    
    EXCEPTION
      WHEN OTHERS THEN
        sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace ||''  '' ||
                                                                                    SQLERRM,
                                                       p_created_by              => p_user_id,
                                                       p_package_name            => c_pkg_name,
                                                       p_procedure_function_name => ''save_' || c_table_name || ''');
      
        raise_application_error(sys_raise_app_error_pkg.c_error_number,
                                sys_raise_app_error_pkg.g_err_line_id);
    END;
    PROCEDURE save_single_entry
    (
      x_status             OUT VARCHAR2,
      x_error_flag         OUT VARCHAR2,
      x_error_type         OUT VARCHAR2,
      x_error_message      OUT VARCHAR2,
      p_itf_header_id      NUMBER,
      p_business_group     VARCHAR2,
      p_external_system_id NUMBER,
      p_history_flag       VARCHAR2,
      p_user_id            NUMBER
    ) IS
      PRAGMA AUTONOMOUS_TRANSACTION;
      rec_header itf_' || c_table_name || '_syn%ROWTYPE;
    
      v_header_id       NUMBER;
      v_is_running_error BOOLEAN;
    BEGIN
      BEGIN
        --获取接口事务
        SELECT h.*
          INTO rec_header
          FROM itf_' || c_table_name || '_syn h
         WHERE h.itf_header_id = p_itf_header_id
               AND h.finished_flag = ''N'';
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          x_status        := itf_object_pkg.g_success;
          x_error_flag    := itf_object_pkg.g_err_flag_n;
          x_error_type    := NULL;
          x_error_message := NULL;
          RETURN;
      END;
      BEGIN
        save_' || c_table_name || '(x_header_id            => v_header_id,--SRM 当前表主键ID
                                   p_business_group        => p_business_group,
                                   p_external_system_id    => p_external_system_id,';
  
    ---循环--------------------------------------------------------------
  
    FOR rec_table IN (SELECT *
                        FROM user_tab_cols t
                       WHERE t.table_name = p_table_name
                         AND t.column_name NOT IN ('CREATION_DATE', 'CREATED_BY', 'LAST_UPDATE_DATE', 'LAST_UPDATED_BY')
                         AND t.column_name NOT LIKE '%GLOBAL_%ATTRIBUTE%'
                         AND t.column_name NOT LIKE '%ATTRIBUTE%')
    LOOP
      srm_str1_temp := 'p_' || TRIM(rec_table.column_name) || '                  => rec_header.' || TRIM(rec_table.column_name) || ',';
      srm_str1      := srm_str1 || srm_str1_temp;
    
    END LOOP;
  
    srm_str0      := '                                 
                                   p_erp_last_updated_by   => rec_header.erp_last_updated_by,
                                   p_erp_last_update_date  =>to_date(rec_header.erp_last_update_date,''yyyy-mm-dd hh24:mi:ss''),
                                   p_erp_last_update_login => rec_header.erp_last_update_login,
                                   p_erp_created_by        => rec_header.erp_created_by,
                                   p_erp_creation_date     =>to_date(rec_header.erp_creation_date,''yyyy-mm-dd hh24:mi:ss''),
                                   p_user_id               => p_user_id);
                                 
   
   
   
   
                                  
        --事务写入成功，out状态
        x_status        := itf_object_pkg.g_success;
        x_error_flag    := itf_object_pkg.g_err_flag_n;
        x_error_type    := NULL;
        x_error_message := NULL;
        COMMIT;
      EXCEPTION
        WHEN itf_core_pkg.e_running_error_exception THEN
          raise_application_error(itf_core_pkg.c_running_error_number,
                                  sys_raise_app_error_pkg.g_err_line_id);
        
        WHEN itf_core_pkg.e_aurora_exception THEN
          raise_application_error(sys_raise_app_error_pkg.c_error_number,
                                  sys_raise_app_error_pkg.g_err_line_id);
        
        WHEN itf_core_pkg.e_master_error_exception THEN
          raise_application_error(itf_core_pkg.c_master_error_number,
                                  sys_raise_app_error_pkg.g_err_line_id);
        WHEN OTHERS THEN
          sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ''
                '' ||
                                                                                      SQLERRM,
                                                         p_created_by              => p_user_id,
                                                         p_package_name            => c_pkg_name,
                                                         p_procedure_function_name => ''save_single_entry'');
          raise_application_error(sys_raise_app_error_pkg.c_error_number,
                                  sys_raise_app_error_pkg.g_err_line_id);
      END;
    EXCEPTION
      WHEN itf_core_pkg.e_running_error_exception THEN
        ROLLBACK;
        --事务写入失败，out状态
        x_status        := itf_object_pkg.g_error;
        x_error_flag    := itf_object_pkg.g_err_flag_y;
        x_error_type    := itf_core_pkg.c_error_type_running_error;
        x_error_message := sys_raise_app_error_pkg.get_sys_raise_app_error(sys_raise_app_error_pkg.g_err_line_id);
      
      WHEN itf_core_pkg.e_master_error_exception THEN
        ROLLBACK;
        --事务写入失败，out状态
        x_status        := itf_object_pkg.g_error;
        x_error_flag    := itf_object_pkg.g_err_flag_y;
        x_error_type    := itf_core_pkg.c_error_type_master_error;
        x_error_message := sys_raise_app_error_pkg.get_sys_raise_app_error(sys_raise_app_error_pkg.g_err_line_id);
      
      WHEN e_aurora_exception THEN
        ROLLBACK;
      
        v_is_running_error := FALSE;
      
        x_status     := itf_object_pkg.g_error;
        x_error_flag := itf_object_pkg.g_err_flag_y;
      
        sys_raise_app_error_pkg.is_running_error(p_app_error_line_id => sys_raise_app_error_pkg.g_err_line_id,
                                                 x_message           => x_error_message,
                                                 x_is_running_error  => v_is_running_error);
      
        --判断错误类型是运行时错误还是业务错误
        IF TRUE = v_is_running_error THEN
          x_error_type := itf_core_pkg.c_error_type_running_error;
        ELSE
          x_error_type := itf_core_pkg.c_error_type_business_error;
        END IF;
      
      WHEN OTHERS THEN
        ROLLBACK;
        v_is_running_error := FALSE;
      
        x_status     := itf_object_pkg.g_error;
        x_error_flag := itf_object_pkg.g_err_flag_y;
      
        sys_raise_app_error_pkg.is_running_error(p_app_error_line_id => sys_raise_app_error_pkg.g_err_line_id,
                                                 x_message           => x_error_message,
                                                 x_is_running_error  => v_is_running_error);
      
        --判断错误类型是运行时错误还是业务错误
        IF TRUE = v_is_running_error THEN
          x_error_type := itf_core_pkg.c_error_type_running_error;
        ELSE
          x_error_type := itf_core_pkg.c_error_type_business_error;
        END IF;
    END ;
  
    PROCEDURE imp_' || c_table_name || '
    (
      x_response_clob   OUT CLOB,
      p_itf_instance_id NUMBER,
      p_user_id         NUMBER
    ) IS
      l_execute_result     g_execute_result_list;
      l_itf_instance       itf_instances_syn%ROWTYPE;
      v_external_system_id NUMBER;
      v_count              NUMBER;
      v_message            VARCHAR2(30);
      v_is_running_error   BOOLEAN;
      v_status             VARCHAR2(30);
      v_error_flag         VARCHAR2(1);
      v_error_type         VARCHAR2(30);
      v_error_message      VARCHAR2(4000);
      v_history_flag       itf_instances_syn.history_flag%TYPE;
    
    BEGIN
      v_count          := 0;
      l_execute_result := g_execute_result_list();
      l_itf_instance   := itf_object_pkg.get_instance(p_itf_instance_id => p_itf_instance_id);
      v_history_flag   := itf_instance_pkg_syn.get_history_flag(p_itf_instance_id);
    
      v_external_system_id := fnd_bg_external_system_pkg.get_external_system_id(p_business_group       => l_itf_instance.business_group,
                                                                                p_external_system_code => l_itf_instance.external_system_code,
                                                                                p_user_id              => p_user_id);
      --获取接口表数据
      FOR rec IN (SELECT msi.itf_header_id
                    FROM itf_' || c_table_name || '_syn msi
                   WHERE msi.itf_instance_id = p_itf_instance_id
                         AND msi.finished_flag = ''N'') LOOP
        save_single_entry(x_status             => v_status,
                        x_error_flag         => v_error_flag,
                        x_error_type         => v_error_type,
                        x_error_message      => v_error_message,
                        p_itf_header_id      => rec.itf_header_id,
                        p_business_group     => l_itf_instance.business_group,
                        p_external_system_id => v_external_system_id,
                        p_history_flag       => v_history_flag,
                        p_user_id            => p_user_id);
      
        itf_object_pkg.add_result(p_execute_result  => l_execute_result,
                                  p_itf_instance_id => p_itf_instance_id,
                                  p_interface_code  => l_itf_instance.interface_code,
                                  p_itf_header_id   => rec.itf_header_id,
                                  p_status          => v_status,
                                  p_err_flag        => v_error_flag,
                                  p_err_type        => v_error_type,
                                  p_message         => v_error_message);
      END LOOP;
      --结果列表转换clob
      itf_object_pkg.object_to_clob(o_clob            => x_response_clob,
                                    p_itf_instance_id => p_itf_instance_id,
                                    i_list            => l_execute_result);
    END ;
  END itf_' || c_table_name || '_pkg;';
    srm_final_str := srm_str4 || srm_str3 || srm_str2 || srm_str1 || srm_str0;
    BEGIN
      SELECT COUNT(1)
        INTO v_count_exist
        FROM itf_interface_sql_cht t
       WHERE t.table_name = c_table_name;
    
    END;
    IF v_count_exist = 0 THEN
      INSERT INTO itf_interface_sql_cht
        (table_name,
         srm_text)
      VALUES
        (c_table_name,
         srm_final_str);
    ELSE
      UPDATE itf_interface_sql_cht t
         SET t.srm_text = srm_final_str
       WHERE t.table_name = c_table_name;
    END IF;
  
  END;
  PROCEDURE create_itf_pkg(p_table_name VARCHAR2) IS
    str0          CLOB;
    str_temp      CLOB;
    str1          CLOB;
    str2          CLOB;
    str3          CLOB;
    str4          CLOB;
    str5          CLOB;
    str6          CLOB;
    str7          CLOB;
    str8          CLOB;
    str           CLOB;
    str_temp_4    CLOB;
    str_temp_7    CLOB;
    final_str     CLOB;
    v_count_exist NUMBER;
    str_header    CLOB;
  BEGIN
    str_header := 'CREATE OR REPLACE PACKAGE itf.eitf_' || lower(c_table_name) || '_pkg IS

  -- Author  : HAITAO CHENG
  -- Created : ' || to_char(SYSDATE, 'YYYY-MM-DD hh24:mi:ss') || '
  -- Purpose : 

  -- Public type declarations
  PROCEDURE main
  (
    x_itf_instance_id  OUT NUMBER,
    p_eitf_instance_id NUMBER,
    p_user_id          NUMBER
  );

END eitf_' || lower(c_table_name) || '_pkg;
';
    str1       := 'CREATE OR REPLACE PACKAGE BODY itf.eitf_' || lower(c_table_name) || '_pkg IS
 c_pkg_name CONSTANT VARCHAR2(300) := ''eitf_' || lower(p_table_name) || '_pkg'';
  PROCEDURE create_itf_' || lower(c_table_name) || '
  (
    x_itf_header_id         OUT NUMBER,
    p_business_group        IN VARCHAR2,
    p_external_system_code  IN VARCHAR2,
    p_seg_num               IN NUMBER DEFAULT NULL,
    p_itf_instance_id       IN NUMBER DEFAULT NULL,
    p_erp_last_updated_by   IN VARCHAR2 DEFAULT NULL,
    p_erp_last_update_date  IN VARCHAR2 DEFAULT NULL,
    p_erp_last_update_login IN VARCHAR2 DEFAULT NULL,
    p_erp_created_by        IN VARCHAR2 DEFAULT NULL,
    p_erp_creation_date     IN VARCHAR2 DEFAULT NULL,' || chr(10);
    FOR rec_table IN (SELECT *
                        FROM user_tab_cols t
                       WHERE t.table_name = p_table_name
                         AND t.column_name NOT IN ('CREATION_DATE', 'CREATED_BY', 'LAST_UPDATE_DATE', 'LAST_UPDATED_BY')
                         AND t.column_name NOT LIKE 'C_ATTRIBUTE%')
    LOOP
      -- FOR rec_table IN (SELECT * FROM daima_temp_cht_15707) LOOP
      str  := '    p_' || lower(TRIM(rec_table.column_name)) || '     ' || 'IN VARCHAR2 DEFAULT NULL,' || chr(10);
      str2 := str2 || str;
    
    END LOOP;
    str3 := '    p_error_type    IN VARCHAR2 DEFAULT NULL,
    p_error_times   IN NUMBER DEFAULT 0,
    p_c_ATTRIBUTE1  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE2  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE3  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE4  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE5  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE6  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE7  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE8  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE9  IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE10 IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE11 IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE12 IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE13 IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE14 IN VARCHAR2 DEFAULT NULL,
    p_c_ATTRIBUTE15 IN VARCHAR2 DEFAULT NULL,
    p_user_id       IN NUMBER
  ) IS
    rec_table itf_' || c_table_name || '%ROWTYPE;
  BEGIN
    rec_table.creation_date    := SYSDATE;
    rec_table.created_by       := p_user_id;
    rec_table.last_update_date := SYSDATE;
    rec_table.last_updated_by  := p_user_id;
     --mes who  字段
    rec_table.erp_last_update_date  := p_erp_last_update_date;
    rec_table.erp_last_updated_by   := p_erp_last_updated_by;
    rec_table.erp_last_update_login := p_erp_last_update_login;
    rec_table.erp_creation_date     := p_erp_creation_date;
    rec_table.erp_created_by        := p_erp_created_by;
    rec_table.business_group        := p_business_group;
    rec_table.external_system_code  := p_external_system_code;
    rec_table.seg_num               := p_seg_num;
    rec_table.itf_instance_id       := p_itf_instance_id;
    rec_table.status                := ''NEW'';
    rec_table.finished_flag         := ''N'';
    rec_table.error_flag            := ''N'';
    rec_table.message_text          := '''';
    rec_table.error_times           := p_error_times;
  
    SELECT itf_' || c_table_name || '_s.nextval INTO rec_table.itf_header_id FROM dual;' || chr(10);
  
    FOR rec_table IN (SELECT *
                        FROM user_tab_cols t
                       WHERE t.table_name = p_table_name
                         AND t.column_name NOT IN ('CREATION_DATE', 'CREATED_BY', 'LAST_UPDATE_DATE', 'LAST_UPDATED_BY')
                         AND t.column_name NOT LIKE 'C_ATTRIBUTE%')
    LOOP
      str_temp_4 := '    rec_table.' || lower(TRIM(rec_table.column_name)) || '   := p_' || lower(rec_table.column_name) || ';' || chr(10);
      str4       := str4 || str_temp_4;
    
    END LOOP;
    str4 := str4 || '    rec_table.c_attribute1   := p_c_attribute1;
    rec_table.c_attribute2   := p_c_attribute2;
    rec_table.c_attribute3   := p_c_attribute3;
    rec_table.c_attribute4   := p_c_attribute4;
    rec_table.c_attribute5   := p_c_attribute5;
    rec_table.c_attribute6   := p_c_attribute6;
    rec_table.c_attribute7   := p_c_attribute7;
    rec_table.c_attribute8   := p_c_attribute8;
    rec_table.c_attribute9   := p_c_attribute9;
    rec_table.c_attribute10  := p_c_attribute10;' || chr(10);
    str5 := '    INSERT INTO itf_' || c_table_name || ' VALUES rec_table;
  
    x_itf_header_id := rec_table' || '.itf_header_id;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace  ||'' '' ||
                                                                                  SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_pkg_name,
                                                      p_procedure_function_name => ''create_itf_' || lower(c_table_name) || ''');
    
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  END;';
    str6 := 'PROCEDURE main
  (
    x_itf_instance_id  OUT NUMBER,
    p_eitf_instance_id NUMBER,
    p_user_id          NUMBER
  ) IS
    v_itf_instance_seg_id NUMBER;
    v_lot_id              NUMBER;
    v_external_system_id  NUMBER;
  
    v_itf_header_id  NUMBER;
    l_eitf_instance  eitf_instances%ROWTYPE;
    v_business_group eitf_instances.business_group%TYPE;
  BEGIN
    --获取实例信息
    l_eitf_instance := eitf_instance_pkg.get_eitf_instance(p_eitf_instance_id);
  
    --对多个接业务库
   FOR r IN (SELECT * FROM itf_sync_systems s WHERE s.enabled_flag = ''Y'') LOOP
  
    --BG转换
    v_business_group := itf_sync_control_pkg.get_relate_business_group(p_system_code    => r.system_code,
                                                                 p_business_group => l_eitf_instance.business_group);
    --若BG为空，则跳过
    IF v_business_group IS NOT NULL THEN
    
      --创建接口实例
      itf_instance_pkg.create_instance(x_itf_instance_id         => x_itf_instance_id,
                                       p_business_group          => v_business_group,
                                       p_external_system_code    => l_eitf_instance.external_system_code,
                                       p_interface_category_code => l_eitf_instance.interface_category_code,
                                       p_interface_code          => l_eitf_instance.interface_code,
                                       p_request_id              => l_eitf_instance.batch_num || l_eitf_instance.seg_num,
                                       p_batch_num               => l_eitf_instance.batch_num,
                                       p_total_seg_count         => l_eitf_instance.total_seg_count,
                                       p_seg_num                 => l_eitf_instance.seg_num,
                                       p_ip_address              => NULL,
                                       p_system_code             => r.system_code, -- 新增,不分库
                                       p_user_id                 => p_user_id); 
         FOR rec_t IN (SELECT * FROM eitf_' || c_table_name || ' t WHERE t.eitf_instance_id = p_eitf_instance_id) LOOP
      
        create_itf_' || c_table_name || '(x_itf_header_id          => v_itf_header_id,
                                    p_business_group         => v_business_group,
                                    p_external_system_code   => l_eitf_instance.external_system_code,
                                    p_seg_num                => l_eitf_instance.seg_num,
                                    p_itf_instance_id        => x_itf_instance_id,' || chr(10);
    FOR rec_table IN (SELECT *
                        FROM user_tab_cols t
                       WHERE t.table_name = p_table_name
                         AND t.column_name NOT IN ('CREATION_DATE', 'CREATED_BY', 'LAST_UPDATE_DATE', 'LAST_UPDATED_BY')
                         AND t.column_name NOT LIKE 'C_ATTRIBUTE%')
    LOOP
      str_temp_7 := '                                    p_' || lower(TRIM(rec_table.column_name)) || '                  => rec_t.' || lower(TRIM(rec_table.column_name)) || ',' || chr(10);
      str7       := str7 || str_temp_7;
    
    END LOOP;
    str8      := '                                    p_erp_last_updated_by    => rec_t.erp_last_updated_by,
                                    p_erp_last_update_date   => rec_t.erp_last_update_date,
                                    p_erp_last_update_login  => rec_t.erp_last_update_login,
                                    p_erp_created_by         => rec_t.erp_created_by,
                                    p_erp_creation_date      => rec_t.erp_creation_date,
                                    p_c_attribute1            => rec_t.c_attribute1,
                                    p_c_attribute2            => rec_t.c_attribute2,
                                    p_c_attribute3           => rec_t.c_attribute3,
                                    p_c_attribute4           => rec_t.c_attribute4,
                                    p_c_attribute5           => rec_t.c_attribute5,
                                    p_c_attribute6           => rec_t.c_attribute6,
                                    p_c_attribute7           => rec_t.c_attribute7,
                                    p_c_attribute8           => rec_t.c_attribute8,
                                    p_c_attribute9           => rec_t.c_attribute9,
                                    p_c_attribute10           => rec_t.c_attribute10,
                                    p_c_attribute11           => rec_t.c_attribute11,
                                    p_c_attribute12           => rec_t.c_attribute12,
                                    p_c_attribute13           => rec_t.c_attribute13,
                                    p_c_attribute14           => rec_t.c_attribute14,
                                    p_c_attribute15           => rec_t.c_attribute15,
                                   
                                    p_user_id                => p_user_id);
      END LOOP;
    END IF;
    END LOOP;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || '' '' ||
                                                                                  SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_pkg_name,
                                                     p_procedure_function_name => ''MAIN'');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  END main;
END eitf_' || c_table_name || '_pkg;';
    final_str := str1 || str2 || str3 || str4 || str5 || str6 || str7 || str8;
  
    SELECT COUNT(1)
      INTO v_count_exist
      FROM itf_interface_sql_cht t
     WHERE t.table_name = c_table_name;
  
    IF v_count_exist = 0 THEN
      INSERT INTO itf_interface_sql_cht
        (table_name,
         itf_text,
         itf_table_head_text)
      VALUES
        (c_table_name,
         final_str,
         str_header);
    ELSE
      UPDATE itf_interface_sql_cht t
         SET t.itf_text            = final_str,
             t.itf_table_head_text = str_header
       WHERE t.table_name = c_table_name;
    END IF;
  
  END;
  PROCEDURE exceute_sql(p_table_name IN VARCHAR2) IS
    v_count_exist NUMBER;
    rec_table     itf_interface_sql_cht%ROWTYPE;
  BEGIN
    SELECT COUNT(1)
      INTO v_count_exist
      FROM itf_interface_sql_cht t
     WHERE t.table_name = c_table_name;
    IF v_count_exist = 1 THEN
      SELECT *
        INTO rec_table
        FROM itf_interface_sql_cht t
       WHERE t.table_name = c_table_name;
      EXECUTE IMMEDIATE rec_table.itf_text;
      EXECUTE IMMEDIATE rec_table.itf_table_head_text;
    END IF;
  END;
  PROCEDURE main(p_tmp_table_name     IN VARCHAR2, --定义的表名（防止表名太长）
                 p_table_name         IN VARCHAR2, --业务表名
                 p_srm_pk_column_name IN VARCHAR2 DEFAULT NULL, --业务表主键字段（外部系统相对应的映射）
                 p_es_column_name1    IN VARCHAR2 DEFAULT NULL --映射的外部系统主键ID 
                 ) IS
  BEGIN
    c_table_name := upper(p_tmp_table_name);
    --创建 ES表
    create_tabel_es(p_table_name => upper(p_table_name), p_srm_pk_column_name => p_srm_pk_column_name, p_es_column_name1 => p_es_column_name1);
    create_eitf_table(p_table_name => upper(p_table_name));
    create_itf_table(p_table_name => upper(p_table_name));
    create_itf_pkg(p_table_name => upper(p_table_name));
    create_srm_pkg(p_table_name => upper(p_table_name));
    --执行语句
    --exceute_sql(p_table_name => upper(p_table_name));
  
  END;

END js_tools_15550_pkg;
/
