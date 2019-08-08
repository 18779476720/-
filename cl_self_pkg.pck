CREATE OR REPLACE PACKAGE cl_self_pkg IS

  -- Author  : CHENG-LU
  -- Created : 2019/7/17 10:50:54
  -- Purpose : 

  c_package_name CONSTANT VARCHAR2(30) := 'cl_self_pkg';

  /*************操作记录*******************
  
  -- p_operation_table：区分标志的表名
  --p_operation_table_id：单据id
  --p_status：状态编码
  --p_status_desc: 状态描述
  --p_operation_desc :操作描述
  --p_user_id:user_id
  ****************************************/

  PROCEDURE operation_record(p_operation_table    VARCHAR2,
                             p_operation_table_id NUMBER,
                             p_status             VARCHAR2,
                             p_status_desc        VARCHAR2,
                             p_operation_desc     VARCHAR2 DEFAULT NULL,
                             p_user_id            NUMBER);

END cl_self_pkg;
/
CREATE OR REPLACE PACKAGE BODY cl_self_pkg IS

  /*************操作记录*******************
  
  -- p_operation_table：区分标志的表名
  --p_operation_table_id：单据id
  --p_status：状态编码
  --p_status_desc: 状态描述
  --p_operation_desc :操作描述
  --p_user_id:user_id
  ****************************************/

  PROCEDURE operation_record(p_operation_table    VARCHAR2,
                             p_operation_table_id NUMBER,
                             p_status             VARCHAR2,
                             p_status_desc        VARCHAR2,
                             p_operation_desc     VARCHAR2 DEFAULT NULL,
                             p_user_id            NUMBER) IS
    t_record_data sd_operation_records%ROWTYPE;
    v_user_name   VARCHAR2(100);
  BEGIN
    SELECT u.description
      INTO v_user_name
      FROM sys_user u
     WHERE u.user_id = p_user_id;
    t_record_data.record_id          := sd_operation_records_s.nextval;
    t_record_data.user_id            := p_user_id;
    t_record_data.user_name          := v_user_name;
    t_record_data.status             := p_status;
    t_record_data.status_desc        := p_status_desc;
    t_record_data.operation_desc     := p_operation_desc;
    t_record_data.operation_table    := p_operation_table;
    t_record_data.operation_table_id := p_operation_table_id;
    t_record_data.created_by         := p_user_id;
    t_record_data.creation_date      := SYSDATE;
    t_record_data.last_updated_by    := p_user_id;
    t_record_data.last_update_date   := SYSDATE;
    INSERT INTO sd_operation_records
    VALUES t_record_data;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_package_name,
                                                     p_procedure_function_name => 'operation_record');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END operation_record;

END cl_self_pkg;
/
