CREATE OR REPLACE PACKAGE "FND_CODE_RULE_PKG" IS

  /*===============================================
    Copyright (C) Hand Business Consulting Services
                AllRights Reserved
  ================================================
  * ===============================================
  *   PROGRAM NAME:
  *                FND_CODE_RULE_PKG
  *   DESCRIPTION:
  *                编码规则PKG
  *   HISTORY:
  *     1.00   2014-09-19   wangcheng   Creation
  *     1.01   2014-12-16   wangcheng   Modified
  *            1.修改公司级的编码规则
  *     1.02   2014-12-17   wangcheng   Modified
  *            1.取消公司级编码规则，参数带入的BG、company换为null
  *     1.03   2015-01-22   wangcheng   Modified
  *            1.取消分配公司以及生成编码时校验、只有云级编码
  * ==============================================*/

  --编码规则功能号
  c_function_code CONSTANT VARCHAR2(30) := 'FND1910';
  --编码规则获取失败
  c_error CONSTANT VARCHAR2(30) := 'ERROR';

  --==========================================================
  --PROCEDURE Name   : insert_fnd_coding_rule_objects
  --Discription     :  插入编码规则对象
  --Note            :
  --Parameter       :
  --   p_rule_object_code                编码规则对象代码
  --   p_rule_object_name                编码规则对象名称
  --   p_rule_object_description         编码规则对象描述
  --   p_foundation_code                 基础数据代码
  --   p_enabled_flag                    启用标志
  --   p_created_by                      系统用户
  --   o_coding_rule_object_id           编码规则对象ID
  --==========================================================
  PROCEDURE insert_fnd_coding_rule_objects(p_rule_object_code        VARCHAR2,
                                           p_rule_object_name        VARCHAR2,
                                           p_rule_object_description VARCHAR2,
                                           p_foundation_code         VARCHAR2,
                                           p_enabled_flag            VARCHAR2,
                                           p_created_by              NUMBER,
                                           o_coding_rule_object_id   OUT NUMBER);

  --==========================================================
  --PROCEDURE Name   : update_fnd_coding_rule_objects
  --Discription     :  更新编码规则对象
  --Note            :
  --Parameter       :
  --   p_rule_object_code                编码规则对象代码
  --   p_rule_object_name                编码规则对象名称
  --   p_rule_object_description         编码规则对象描述
  --   p_foundation_code                 基础数据代码
  --   p_enabled_flag                    启用标志
  --   p_created_by                      系统用户
  --==========================================================
  PROCEDURE update_fnd_coding_rule_objects(p_rule_object_code        VARCHAR2,
                                           p_rule_object_name        VARCHAR2,
                                           p_rule_object_description VARCHAR2,
                                           p_foundation_code         VARCHAR2,
                                           p_enabled_flag            VARCHAR2,
                                           p_created_by              NUMBER);

  --==========================================================
  --PROCEDURE Name   : insert_fnd_coding_rules
  --Discription     :  插入编码规则
  --Note            :
  --Parameter       :
  --   p_coding_rule_object_id    编码规则对象ID
  --   p_coding_rule_code         编码规则代码
  --   p_description              编码规则描述
  --   p_note                     备注
  --   p_reset_frequence          重置频率
  --   p_enabled_flag             启用标志
  --   p_created_by               系统用户
  --   o_coding_rule_id           编码规则ID
  --==========================================================
  PROCEDURE insert_fnd_coding_rules(p_coding_rule_object_id NUMBER,
                                    p_coding_rule_code      VARCHAR2,
                                    p_description           VARCHAR2,
                                    p_note                  VARCHAR2,
                                    p_reset_frequence       VARCHAR2,
                                    p_enabled_flag          VARCHAR2,
                                    p_created_by            NUMBER,
                                    o_coding_rule_id        OUT NUMBER);

  --==========================================================
  --PROCEDURE Name   : update_fnd_coding_rules
  --Discription     :  更新编码规则
  --Note            :
  --Parameter       :
  --   p_coding_rule_id           编码规则ID
  --   p_description              编码规则描述
  --   p_note                     备注
  --   p_reset_frequence          重置频率
  --   p_enabled_flag             启用标志
  --   p_created_by               系统用户
  --==========================================================
  PROCEDURE update_fnd_coding_rules(p_coding_rule_id  NUMBER,
                                    p_description     VARCHAR2,
                                    p_note            VARCHAR2,
                                    p_reset_frequence VARCHAR2,
                                    p_enabled_flag    VARCHAR2,
                                    p_created_by      NUMBER);

  --==========================================================
  --PROCEDURE Name   : insert_fnd_coding_rule_details
  --Discription     :  插入编码规则明细
  --Note            :
  --Parameter       :
  --   p_coding_rule_id           编码规则ID
  --   p_sequence                 序列号
  --   p_segment_type             段类型
  --   p_segment_value            段值
  --   p_date_format              日期格式
  --   p_length                   位数
  --   p_incremental              步长
  --   p_start_value              开始值
  --   p_end_value                结束值
  --   p_created_by               系统用户
  --   o_coding_rule_detail_id    编码规则明细ID
  --==========================================================
  PROCEDURE insert_fnd_coding_rule_details(p_coding_rule_id        NUMBER,
                                           p_sequence              NUMBER,
                                           p_segment_type          VARCHAR2,
                                           p_segment_value         VARCHAR2,
                                           p_date_format           VARCHAR2,
                                           p_length                NUMBER,
                                           p_incremental           NUMBER,
                                           p_start_value           NUMBER,
                                           p_end_value             NUMBER,
                                           p_created_by            NUMBER,
                                           o_coding_rule_detail_id OUT NUMBER);

  --==========================================================
  --PROCEDURE Name   : update_fnd_coding_rule_details
  --Discription     :  更新编码规则明细
  --Note            :
  --Parameter       :
  --   p_coding_rule_detail_id    编码规则明细ID
  --   p_segment_type             段类型
  --   p_segment_value            段值
  --   p_date_format              日期格式
  --   p_length                   位数
  --   p_incremental              步长
  --   p_start_value              开始值
  --   p_end_value                结束值
  --   p_created_by               系统用户
  --==========================================================
  PROCEDURE update_fnd_coding_rule_details(p_coding_rule_detail_id NUMBER,
                                           p_segment_type          VARCHAR2,
                                           p_segment_value         VARCHAR2,
                                           p_date_format           VARCHAR2,
                                           p_length                NUMBER,
                                           p_incremental           NUMBER,
                                           p_start_value           NUMBER,
                                           p_end_value             NUMBER,
                                           p_created_by            NUMBER);

  --==========================================================
  --PROCEDURE Name   : insert_fnd_coding_rule_company
  --Discription     :  编码规则分配到公司
  --Note            :
  --Parameter       :
  --   p_coding_rule_object_id    编码规则对象ID
  --   p_coding_rule_id           编码规则ID
  --   p_company_id               公司ID
  --   p_created_by               系统用户
  --==========================================================
  PROCEDURE insert_fnd_coding_rule_company(p_coding_rule_object_id NUMBER,
                                           p_coding_rule_id        NUMBER,
                                           p_company_id            NUMBER,
                                           p_created_by            NUMBER);

  --==========================================================
  --PROCEDURE Name   : delete_fnd_coding_rule_company
  --Discription     :  删除规则分配公司
  --Note            :
  --Parameter       :
  --   p_rule_company_id          编码规则公司关系ID
  --   p_created_by               系统用户
  --==========================================================
  PROCEDURE delete_fnd_coding_rule_company(p_rule_company_id NUMBER,
                                           p_created_by      NUMBER);

  --==========================================================
  --PROCEDURE Name   : get_rule_next_auto_num
  --Discription     :  获取编码规则
  --Note            :
  --Parameter       :
  --   p_rule_object_code       编码规则对象代码
  --   p_business_group         商业集团代码
  --   p_company_id             公司ID
  --   p_session_user_id        系统用户
  --==========================================================
  FUNCTION get_rule_next_auto_num(p_rule_object_code VARCHAR2,
                                  p_business_group   VARCHAR2 DEFAULT NULL,
                                  p_company_id       NUMBER DEFAULT NULL,
                                  p_session_user_id  NUMBER) RETURN VARCHAR2;

  --==========================================================
  --PROCEDURE Name   : get_document_type_name
  --Discription     :
  --Note            :
  --Parameter       :
  --==========================================================
  FUNCTION get_document_type_name(p_company_id        NUMBER,
                                  p_document_category VARCHAR2,
                                  p_document_type     VARCHAR2) RETURN VARCHAR2;

  --==========================================================
  -- ProcedureName   : load_coding_rule_object
  -- Description     : 导入编码规则对象
  -- Note            :
  --  导入常用的编码规则的对象，以防手工误改
  -- Parameter       :
  --  p_rule_object_code 编码规则对象代码
  --  p_rule_object_name 编码规则对象名称
  --==========================================================
  PROCEDURE load_coding_rule_object(p_rule_object_code VARCHAR2,
                                    p_rule_object_name VARCHAR2);

  FUNCTION get_max_value(p_length NUMBER) RETURN NUMBER;

END fnd_code_rule_pkg;
/
CREATE OR REPLACE PACKAGE BODY "FND_CODE_RULE_PKG" IS

  g_company_id NUMBER;

  PROCEDURE error_log(p_message VARCHAR2,
                      p_user_id NUMBER) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    INSERT INTO fnd_coding_rule_error_logs
      (company_id,
       document_category,
       document_type,
       operation_unit_id,
       operation_date,
       message,
       created_by,
       creation_date,
       last_updated_by,
       last_update_date)
    VALUES
      (NULL,
       NULL,
       NULL,
       NULL,
       SYSDATE,
       p_message,
       p_user_id,
       SYSDATE,
       p_user_id,
       SYSDATE);
    COMMIT;
  END error_log;

  --编码规则对象定义
  PROCEDURE insert_fnd_coding_rule_objects(p_rule_object_code        VARCHAR2,
                                           p_rule_object_name        VARCHAR2,
                                           p_rule_object_description VARCHAR2,
                                           p_foundation_code         VARCHAR2,
                                           p_enabled_flag            VARCHAR2,
                                           p_created_by              NUMBER,
                                           o_coding_rule_object_id   OUT NUMBER) IS
    v_coding_rule_object_id      fnd_coding_rule_objects.coding_rule_object_id%TYPE;
    v_rule_object_name_id        fnd_coding_rule_objects.rule_object_name_id%TYPE;
    v_rule_object_description_id fnd_coding_rule_objects.rule_object_description_id%TYPE;
  BEGIN
  
    SELECT fnd_coding_rule_objects_s.nextval
      INTO v_coding_rule_object_id
      FROM dual;
  
    IF p_rule_object_name IS NOT NULL THEN
      v_rule_object_name_id := fnd_description_pkg.get_fnd_description_id;
      fnd_description_pkg.reset_fnd_descriptions(p_description_id   => v_rule_object_name_id,
                                                 p_language_code    => userenv('lang'),
                                                 p_ref_table        => 'FND_CODING_RULE_OBJECTS',
                                                 p_ref_field        => 'RULE_OBJECT_NAME_ID',
                                                 p_description_text => p_rule_object_name,
                                                 p_created_by       => p_created_by,
                                                 p_last_updated_by  => p_created_by);
    END IF;
  
    IF p_rule_object_description IS NOT NULL THEN
      v_rule_object_description_id := fnd_description_pkg.get_fnd_description_id;
      fnd_description_pkg.reset_fnd_descriptions(p_description_id   => v_rule_object_description_id,
                                                 p_language_code    => userenv('lang'),
                                                 p_ref_table        => 'FND_CODING_RULE_OBJECTS',
                                                 p_ref_field        => 'RULE_OBJECT_DESCRIPTION_ID',
                                                 p_description_text => p_rule_object_description,
                                                 p_created_by       => p_created_by,
                                                 p_last_updated_by  => p_created_by);
    END IF;
  
    INSERT INTO fnd_coding_rule_objects
      (coding_rule_object_id,
       rule_object_code,
       rule_object_name_id,
       rule_object_description_id,
       foundation_code,
       enabled_flag,
       creation_date,
       created_by,
       last_update_date,
       last_updated_by)
    VALUES
      (v_coding_rule_object_id,
       p_rule_object_code,
       v_rule_object_name_id,
       v_rule_object_description_id,
       p_foundation_code,
       p_enabled_flag,
       SYSDATE,
       p_created_by,
       SYSDATE,
       p_created_by);
  
    o_coding_rule_object_id := v_coding_rule_object_id;
  
  EXCEPTION
    WHEN dup_val_on_index THEN
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => 'FND_RULE_OBJECT_CODE.UNIQUE_ERROR',
                                                      p_created_by              => p_created_by,
                                                      p_package_name            => 'fnd_code_rule_pkg',
                                                      p_procedure_function_name => 'insert_fnd_coding_rule_objects');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_created_by,
                                                     p_package_name            => 'fnd_code_rule_pkg',
                                                     p_procedure_function_name => 'insert_fnd_coding_rule_objects');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END insert_fnd_coding_rule_objects;

  --更新编码规则对象
  PROCEDURE update_fnd_coding_rule_objects(p_rule_object_code        VARCHAR2,
                                           p_rule_object_name        VARCHAR2,
                                           p_rule_object_description VARCHAR2,
                                           p_foundation_code         VARCHAR2,
                                           p_enabled_flag            VARCHAR2,
                                           p_created_by              NUMBER) IS
  
    CURSOR cur_record IS
      SELECT *
        FROM fnd_coding_rule_objects
       WHERE rule_object_code = p_rule_object_code
         FOR UPDATE NOWAIT;
  
    v_rule_object_name_id        fnd_coding_rule_objects.rule_object_name_id%TYPE;
    v_rule_object_description_id fnd_coding_rule_objects.rule_object_description_id%TYPE;
  BEGIN
    OPEN cur_record;
    UPDATE fnd_coding_rule_objects t
       SET t.foundation_code  = p_foundation_code,
           t.enabled_flag     = p_enabled_flag,
           t.last_update_date = SYSDATE,
           t.last_updated_by  = p_created_by
     WHERE t.rule_object_code = p_rule_object_code;
    CLOSE cur_record;
  
    BEGIN
      SELECT t.rule_object_name_id,
             t.rule_object_description_id
        INTO v_rule_object_name_id,
             v_rule_object_description_id
        FROM fnd_coding_rule_objects t
       WHERE t.rule_object_code = p_rule_object_code;
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
    END;
    IF p_rule_object_name IS NOT NULL THEN
      fnd_description_pkg.reset_fnd_descriptions(p_description_id   => v_rule_object_name_id,
                                                 p_language_code    => userenv('lang'),
                                                 p_ref_table        => 'FND_CODING_RULE_OBJECTS',
                                                 p_ref_field        => 'RULE_OBJECT_NAME_ID',
                                                 p_description_text => p_rule_object_name,
                                                 p_created_by       => p_created_by,
                                                 p_last_updated_by  => p_created_by);
    END IF;
    IF p_rule_object_description IS NOT NULL THEN
      fnd_description_pkg.reset_fnd_descriptions(p_description_id   => v_rule_object_description_id,
                                                 p_language_code    => userenv('lang'),
                                                 p_ref_table        => 'FND_CODING_RULE_OBJECTS',
                                                 p_ref_field        => 'RULE_OBJECT_DESCRIPTION_ID',
                                                 p_description_text => p_rule_object_description,
                                                 p_created_by       => p_created_by,
                                                 p_last_updated_by  => p_created_by);
    END IF;
  END update_fnd_coding_rule_objects;

  --编码规则校验（同一个编码规则对象中编码规则只能启用一个）
  PROCEDURE check_coding_rule_enabled(p_coding_rule_object_id NUMBER,
                                      p_user_id               NUMBER) IS
    --对象中规则启用数量
    v_count NUMBER;
    --启用数量错误
    e_coding_rule_count_error EXCEPTION;
  BEGIN
    SELECT COUNT(1)
      INTO v_count
      FROM fnd_coding_rules fcr
     WHERE fcr.coding_rule_object_id = p_coding_rule_object_id
       AND fcr.enabled_flag = 'Y';
  
    --如果v_count大于1
    IF v_count > 1 THEN
      RAISE e_coding_rule_count_error;
    END IF;
  
  EXCEPTION
    WHEN e_coding_rule_count_error THEN
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => 'FND_CODING_RULE_COUNT_ERROR',
                                                      p_created_by              => p_user_id,
                                                      p_package_name            => 'fnd_code_rule_pkg',
                                                      p_procedure_function_name => 'check_coding_rule_enabled');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'fnd_code_rule_pkg',
                                                     p_procedure_function_name => 'check_coding_rule_enabled');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
    
  END check_coding_rule_enabled;

  --根据编码规则ID获取对象ID
  FUNCTION get_coding_rule_object_id(p_coding_rule_id NUMBER) RETURN NUMBER IS
    v_coding_rule_object_id fnd_coding_rule_objects.coding_rule_object_id%TYPE;
  BEGIN
    SELECT fcr.coding_rule_object_id
      INTO v_coding_rule_object_id
      FROM fnd_coding_rules fcr
     WHERE fcr.coding_rule_id = p_coding_rule_id;
  
    RETURN v_coding_rule_object_id;
  
  END get_coding_rule_object_id;

  --编码规则定义
  PROCEDURE insert_fnd_coding_rules(p_coding_rule_object_id NUMBER,
                                    p_coding_rule_code      VARCHAR2,
                                    p_description           VARCHAR2,
                                    p_note                  VARCHAR2,
                                    p_reset_frequence       VARCHAR2,
                                    p_enabled_flag          VARCHAR2,
                                    p_created_by            NUMBER,
                                    o_coding_rule_id        OUT NUMBER) IS
    v_coding_rule_id fnd_coding_rules.coding_rule_id%TYPE;
    v_description_id fnd_coding_rules.description_id%TYPE;
  
  BEGIN
    SELECT fnd_coding_rules_s.nextval
      INTO v_coding_rule_id
      FROM dual;
    IF p_description IS NOT NULL THEN
      v_description_id := fnd_description_pkg.get_fnd_description_id;
      fnd_description_pkg.reset_fnd_descriptions(p_description_id   => v_description_id,
                                                 p_language_code    => userenv('lang'),
                                                 p_ref_table        => 'FND_CODING_RULES',
                                                 p_ref_field        => 'DESCRIPTION_ID',
                                                 p_description_text => p_description,
                                                 p_created_by       => p_created_by,
                                                 p_last_updated_by  => p_created_by);
    END IF;
    INSERT INTO fnd_coding_rules
      (coding_rule_id,
       coding_rule_object_id,
       coding_rule_code,
       description_id,
       note,
       reset_frequence,
       enabled_flag,
       creation_date,
       created_by,
       last_update_date,
       last_updated_by)
    VALUES
      (v_coding_rule_id,
       p_coding_rule_object_id,
       p_coding_rule_code,
       v_description_id,
       p_note,
       p_reset_frequence,
       p_enabled_flag,
       SYSDATE,
       p_created_by,
       SYSDATE,
       p_created_by);
  
    o_coding_rule_id := v_coding_rule_id;
  
    --校验启用数量
    check_coding_rule_enabled(p_coding_rule_object_id => p_coding_rule_object_id, p_user_id => p_created_by);
  EXCEPTION
    WHEN dup_val_on_index THEN
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => 'FND_CODING_RULE_CODE.UNIQUE_ERROR',
                                                      p_created_by              => p_created_by,
                                                      p_package_name            => 'fnd_code_rule_pkg',
                                                      p_procedure_function_name => 'insert_fnd_coding_rules');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_created_by,
                                                     p_package_name            => 'fnd_code_rule_pkg',
                                                     p_procedure_function_name => 'insert_fnd_coding_rules');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END insert_fnd_coding_rules;

  --更新编码规则
  PROCEDURE update_fnd_coding_rules(p_coding_rule_id  NUMBER,
                                    p_description     VARCHAR2,
                                    p_note            VARCHAR2,
                                    p_reset_frequence VARCHAR2,
                                    p_enabled_flag    VARCHAR2,
                                    p_created_by      NUMBER) IS
  
    CURSOR cur_record IS
      SELECT *
        FROM fnd_coding_rules t
       WHERE t.coding_rule_id = p_coding_rule_id
         FOR UPDATE NOWAIT;
    v_description_id fnd_coding_rules.description_id%TYPE;
  
    --编码规则对象ID
    v_coding_rule_object_id NUMBER;
  
  BEGIN
    OPEN cur_record;
    UPDATE fnd_coding_rules t
       SET t.note             = p_note,
           t.reset_frequence  = p_reset_frequence,
           t.enabled_flag     = p_enabled_flag,
           t.last_update_date = SYSDATE,
           t.last_updated_by  = p_created_by
     WHERE t.coding_rule_id = p_coding_rule_id;
    CLOSE cur_record;
  
    BEGIN
      SELECT t.description_id
        INTO v_description_id
        FROM fnd_coding_rules t
       WHERE t.coding_rule_id = p_coding_rule_id;
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
    END;
    IF p_description IS NOT NULL THEN
      fnd_description_pkg.reset_fnd_descriptions(p_description_id   => v_description_id,
                                                 p_language_code    => userenv('lang'),
                                                 p_ref_table        => 'FND_CODING_RULES',
                                                 p_ref_field        => 'DESCRIPTION_ID',
                                                 p_description_text => p_description,
                                                 p_created_by       => p_created_by,
                                                 p_last_updated_by  => p_created_by);
    END IF;
  
    --校验启用数量
    v_coding_rule_object_id := get_coding_rule_object_id(p_coding_rule_id => p_coding_rule_id);
    check_coding_rule_enabled(p_coding_rule_object_id => v_coding_rule_object_id, p_user_id => p_created_by);
  
  END update_fnd_coding_rules;

  --编码规则明细定义
  PROCEDURE insert_fnd_coding_rule_details(p_coding_rule_id        NUMBER,
                                           p_sequence              NUMBER,
                                           p_segment_type          VARCHAR2,
                                           p_segment_value         VARCHAR2,
                                           p_date_format           VARCHAR2,
                                           p_length                NUMBER,
                                           p_incremental           NUMBER,
                                           p_start_value           NUMBER,
                                           p_end_value             NUMBER,
                                           p_created_by            NUMBER,
                                           o_coding_rule_detail_id OUT NUMBER) IS
    v_coding_rule_detail_id fnd_coding_rule_details.coding_rule_detail_id%TYPE;
  
  BEGIN
    SELECT fnd_coding_rule_details_s.nextval
      INTO v_coding_rule_detail_id
      FROM dual;
  
    INSERT INTO fnd_coding_rule_details
      (coding_rule_detail_id,
       coding_rule_id,
       sequence,
       segment_type,
       segment_value,
       date_format,
       length,
       incremental,
       start_value,
       end_value,
       creation_date,
       created_by,
       last_update_date,
       last_updated_by)
    VALUES
      (v_coding_rule_detail_id,
       p_coding_rule_id,
       p_sequence,
       p_segment_type,
       p_segment_value,
       p_date_format,
       p_length,
       p_incremental,
       p_start_value,
       p_end_value,
       SYSDATE,
       p_created_by,
       SYSDATE,
       p_created_by);
  
    o_coding_rule_detail_id := v_coding_rule_detail_id;
  
  EXCEPTION
    WHEN dup_val_on_index THEN
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => 'FND_CODING_RULE_DETAIL.UNIQUE_ERROR',
                                                      p_created_by              => p_created_by,
                                                      p_package_name            => 'fnd_code_rule_pkg',
                                                      p_procedure_function_name => 'insert_fnd_coding_rule_details');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_created_by,
                                                     p_package_name            => 'fnd_code_rule_pkg',
                                                     p_procedure_function_name => 'insert_fnd_coding_rule_details');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
    
  END insert_fnd_coding_rule_details;

  --更改编码规则明细
  PROCEDURE update_fnd_coding_rule_details(p_coding_rule_detail_id NUMBER,
                                           p_segment_type          VARCHAR2,
                                           p_segment_value         VARCHAR2,
                                           p_date_format           VARCHAR2,
                                           p_length                NUMBER,
                                           p_incremental           NUMBER,
                                           p_start_value           NUMBER,
                                           p_end_value             NUMBER,
                                           p_created_by            NUMBER) IS
    CURSOR cur_record IS
      SELECT *
        FROM fnd_coding_rule_details t
       WHERE t.coding_rule_detail_id = p_coding_rule_detail_id
         FOR UPDATE NOWAIT;
  BEGIN
    OPEN cur_record;
    UPDATE fnd_coding_rule_details
       SET segment_type     = p_segment_type,
           segment_value    = p_segment_value,
           date_format      = p_date_format,
           length           = p_length,
           incremental      = p_incremental,
           start_value      = p_start_value,
           end_value        = p_end_value,
           last_update_date = SYSDATE,
           last_updated_by  = p_created_by
     WHERE coding_rule_detail_id = p_coding_rule_detail_id;
    CLOSE cur_record;
  END update_fnd_coding_rule_details;

  --编码规则分配
  PROCEDURE insert_fnd_coding_rule_company(p_coding_rule_object_id NUMBER,
                                           p_coding_rule_id        NUMBER,
                                           p_company_id            NUMBER,
                                           p_created_by            NUMBER) IS
    v_rule_company_id fnd_coding_rule_company.rule_company_id%TYPE;
  BEGIN
  
    SELECT fnd_coding_rule_company_s.nextval
      INTO v_rule_company_id
      FROM dual;
  
    INSERT INTO fnd_coding_rule_company
      (rule_company_id,
       coding_rule_object_id,
       coding_rule_id,
       company_id,
       creation_date,
       created_by,
       last_update_date,
       last_updated_by)
    VALUES
      (v_rule_company_id,
       p_coding_rule_object_id,
       p_coding_rule_id,
       p_company_id,
       SYSDATE,
       p_created_by,
       SYSDATE,
       p_created_by);
  
  EXCEPTION
    WHEN dup_val_on_index THEN
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => 'FND_CODE_RULE_COMPANY.UNIQUE_ERROR',
                                                      p_created_by              => p_created_by,
                                                      p_package_name            => 'fnd_code_rule_pkg',
                                                      p_procedure_function_name => 'insert_fnd_coding_rule_company');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_created_by,
                                                     p_package_name            => 'fnd_code_rule_pkg',
                                                     p_procedure_function_name => 'insert_fnd_coding_rule_company');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END insert_fnd_coding_rule_company;

  --编码规则分配后删除
  PROCEDURE delete_fnd_coding_rule_company(p_rule_company_id NUMBER,
                                           p_created_by      NUMBER) IS
  BEGIN
    DELETE FROM fnd_coding_rule_company t
     WHERE t.rule_company_id = p_rule_company_id;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_created_by,
                                                     p_package_name            => 'fnd_code_rule_pkg',
                                                     p_procedure_function_name => 'delete_fnd_coding_rule_company');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END delete_fnd_coding_rule_company;

  --编码规则当前值
  PROCEDURE insert_fnd_coding_rule_values(x_coding_rule_value_id OUT NUMBER,
                                          p_coding_rule_id       IN NUMBER,
                                          p_company_id           IN NUMBER DEFAULT NULL,
                                          p_business_group       IN VARCHAR2 DEFAULT NULL,
                                          p_year                 IN VARCHAR2 DEFAULT NULL,
                                          p_month                IN VARCHAR2 DEFAULT NULL,
                                          p_day                  IN VARCHAR2 DEFAULT NULL,
                                          p_period_name          IN VARCHAR2 DEFAULT NULL,
                                          p_current_value        IN NUMBER,
                                          p_user_id              IN NUMBER) IS
    t_fnd_coding_rule_values fnd_coding_rule_values%ROWTYPE;
  BEGIN
  
    t_fnd_coding_rule_values.creation_date    := SYSDATE;
    t_fnd_coding_rule_values.created_by       := p_user_id;
    t_fnd_coding_rule_values.last_update_date := SYSDATE;
    t_fnd_coding_rule_values.last_updated_by  := p_user_id;
  
    SELECT fnd_coding_rule_values_s.nextval
      INTO t_fnd_coding_rule_values.coding_rule_value_id
      FROM dual;
  
    t_fnd_coding_rule_values.coding_rule_id := p_coding_rule_id;
    t_fnd_coding_rule_values.company_id     := p_company_id;
    t_fnd_coding_rule_values.business_group := p_business_group;
    t_fnd_coding_rule_values.year           := p_year;
    t_fnd_coding_rule_values.month          := p_month;
    t_fnd_coding_rule_values.day            := p_day;
    t_fnd_coding_rule_values.period_name    := p_period_name;
    t_fnd_coding_rule_values.current_value  := p_current_value;
  
    INSERT INTO fnd_coding_rule_values
    VALUES t_fnd_coding_rule_values;
  
    x_coding_rule_value_id := t_fnd_coding_rule_values.coding_rule_value_id;
  
  END insert_fnd_coding_rule_values;

  --编码规则随机数
  PROCEDURE insert_coding_rule_val_random(
                                          --o_coding_rule_random_id OUT NUMBER,
                                          p_coding_rule_value_id IN NUMBER,
                                          p_random_value         IN NUMBER,
                                          p_user_id              IN NUMBER) IS
    t_fnd_coding_rule_val_random fnd_coding_rule_val_random%ROWTYPE;
  
  BEGIN
    t_fnd_coding_rule_val_random.creation_date    := SYSDATE;
    t_fnd_coding_rule_val_random.created_by       := p_user_id;
    t_fnd_coding_rule_val_random.last_update_date := SYSDATE;
    t_fnd_coding_rule_val_random.last_updated_by  := p_user_id;
  
    SELECT fnd_coding_rule_val_random_s.nextval
      INTO t_fnd_coding_rule_val_random.coding_rule_random_id
      FROM dual;
  
    t_fnd_coding_rule_val_random.coding_rule_value_id := p_coding_rule_value_id;
    t_fnd_coding_rule_val_random.random_value         := p_random_value;
  
    INSERT INTO fnd_coding_rule_val_random
    VALUES t_fnd_coding_rule_val_random;
  
    --o_coding_rule_random_id := t_fnd_coding_rule_val_random.coding_rule_random_id;
  
  END insert_coding_rule_val_random;

  --获取编码规则对象
  --根据code获取
  FUNCTION get_coding_rule_object_id(p_rule_object_code VARCHAR2) RETURN NUMBER IS
    v_coding_rule_object_id fnd_coding_rule_objects.coding_rule_object_id%TYPE;
  BEGIN
    SELECT t.coding_rule_object_id
      INTO v_coding_rule_object_id
      FROM fnd_coding_rule_objects t
     WHERE t.rule_object_code = p_rule_object_code
       AND t.enabled_flag = 'Y';
  
    RETURN v_coding_rule_object_id;
  
  EXCEPTION
    WHEN no_data_found THEN
      RETURN NULL;
  END get_coding_rule_object_id;

  --获取编码规则
  FUNCTION get_coding_rule_id(p_coding_rule_object_id NUMBER) RETURN NUMBER IS
    v_coding_rule_id fnd_coding_rules.coding_rule_id%TYPE;
  BEGIN
    SELECT t.coding_rule_id
      INTO v_coding_rule_id
      FROM fnd_coding_rules t
     WHERE t.coding_rule_object_id = p_coding_rule_object_id
       AND t.enabled_flag = 'Y';
    RETURN v_coding_rule_id;
  EXCEPTION
    WHEN no_data_found THEN
      RETURN NULL;
    WHEN too_many_rows THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message => 'FND_CODING_RULE_NULL', p_created_by => 1, p_package_name => 'fnd_code_rule_pkg', p_procedure_function_name => 'get_coding_rule_id');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => 1,
                                                     p_package_name            => 'fnd_code_rule_pkg',
                                                     p_procedure_function_name => 'get_coding_rule_id');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END get_coding_rule_id;

  --获取编码规则值
  FUNCTION get_coding_rule_value_id(p_coding_rule_id NUMBER,
                                    p_company_id     NUMBER,
                                    p_business_group VARCHAR2,
                                    p_year           NUMBER,
                                    p_month          VARCHAR2,
                                    p_day            VARCHAR2,
                                    p_period_name    VARCHAR2) RETURN NUMBER IS
    v_coding_rule_value_id fnd_coding_rule_values.coding_rule_value_id%TYPE;
  BEGIN
    SELECT coding_rule_value_id
      INTO v_coding_rule_value_id
      FROM fnd_coding_rule_values v
     WHERE coding_rule_id = p_coding_rule_id
       AND (company_id = p_company_id OR (company_id IS NULL AND p_company_id IS NULL))
       AND (business_group = p_business_group OR (business_group IS NULL AND p_business_group IS NULL))
       AND (v.year = p_year OR (v.year IS NULL AND p_year IS NULL))
       AND (period_name = p_period_name OR (period_name IS NULL AND p_period_name IS NULL))
       AND (v.month = p_month OR (v.month IS NULL AND p_month IS NULL))
       AND (v.day = p_day OR (v.day IS NULL AND p_day IS NULL));
    RETURN v_coding_rule_value_id;
  EXCEPTION
    WHEN no_data_found THEN
      RETURN NULL;
  END get_coding_rule_value_id;

  --获取重置频率
  FUNCTION get_reset_frequence(p_coding_rule_object_id NUMBER) RETURN VARCHAR2 IS
    v_reset_frequence fnd_coding_rules.reset_frequence%TYPE;
  BEGIN
    SELECT t.reset_frequence
      INTO v_reset_frequence
      FROM fnd_coding_rules t
     WHERE t.coding_rule_object_id = p_coding_rule_object_id
       AND t.enabled_flag = 'Y';
    RETURN v_reset_frequence;
  EXCEPTION
    WHEN no_data_found THEN
      RETURN NULL;
  END get_reset_frequence;

  FUNCTION get_gld_period_name(p_company_id     NUMBER,
                               p_operation_date DATE) RETURN VARCHAR2 IS
    v_period_name gld_periods.period_name%TYPE;
  BEGIN
  
    --
    IF p_company_id IS NULL THEN
      RETURN NULL;
    END IF;
  
    SELECT g.period_name
      INTO v_period_name
      FROM gld_periods g
    --, gld_period_status p
     WHERE g.start_date <= trunc(p_operation_date)
       AND g.end_date >= trunc(p_operation_date)
          --and g.period_set_code = p.period_set_code
          --and p.company_id = p_company_id
          --and p.internal_period_num = g.internal_period_num
          --and p.period_status_code = 'O'  --for mantis 0025577
       AND g.period_set_code = (SELECT b.period_set_code
                                  FROM gld_set_of_books b
                                 WHERE b.set_of_books_id = (SELECT f.set_of_books_id
                                                              FROM fnd_companies f
                                                             WHERE f.company_id = p_company_id))
       AND g.adjustment_flag = 'N';
    RETURN v_period_name;
  EXCEPTION
    WHEN no_data_found THEN
      RETURN NULL;
  END get_gld_period_name;

  ---------------------------------
  ---------------------------------
  FUNCTION get_detail_segment_value(p_coding_rule_id NUMBER,
                                    p_segment_type   VARCHAR2) RETURN BOOLEAN IS
    v_exists NUMBER;
  BEGIN
    SELECT 1
      INTO v_exists
      FROM dual
     WHERE EXISTS (SELECT 1
              FROM fnd_coding_rule_details d
             WHERE d.coding_rule_id = p_coding_rule_id
               AND d.segment_type = p_segment_type);
  
    RETURN TRUE;
  EXCEPTION
    WHEN no_data_found THEN
      RETURN FALSE;
  END get_detail_segment_value;

  --通过位数获取最大值
  FUNCTION get_max_value(p_length NUMBER) RETURN NUMBER IS
    v_max_value NUMBER := 1;
    v_length    NUMBER;
  BEGIN
    v_length := p_length;
    WHILE v_length > 0
    LOOP
      v_max_value := v_max_value * 10;
      v_length    := v_length - 1;
    END LOOP;
    --v_max_value:=v_max_value-1;
    RETURN v_max_value;
  END get_max_value;

  --获取编码规则随机数
  FUNCTION get_random_value(p_coding_rule_value_id NUMBER,
                            --p_company_id           NUMBER,
                            p_length      NUMBER,
                            p_start_value NUMBER,
                            p_end_value   NUMBER,
                            p_user_id     NUMBER) RETURN NUMBER IS
    v_random_value fnd_coding_rule_val_random.random_value%TYPE;
    v_start_value  fnd_coding_rule_details.start_value%TYPE;
    v_end_value    fnd_coding_rule_details.end_value%TYPE;
    v_max_value    NUMBER;
    v_count_value  NUMBER := 1;
    v_exist        NUMBER;
  
    e_create_random_error EXCEPTION; --产生随机数失败
  BEGIN
  
    --如果开始值为空、设为0
    SELECT nvl(p_start_value, 0)
      INTO v_start_value
      FROM dual;
  
    v_max_value := get_max_value(p_length);
    --获取最大值
    --select power(10,p_length) into v_max_value from dual;
  
    IF p_end_value IS NULL THEN
      v_end_value := v_max_value;
    ELSIF p_end_value > v_max_value THEN
      v_end_value := v_max_value;
    ELSE
      v_end_value := p_end_value;
    END IF;
  
    --循环去随机数
    --表中没有该值（返回该值）
    --表中有该值（继续循环）
    WHILE v_count_value <= 100
    LOOP
      SELECT trunc(dbms_random.value(v_start_value, v_end_value))
        INTO v_random_value
        FROM dual;
    
      BEGIN
        SELECT 1
          INTO v_exist
          FROM fnd_coding_rule_val_random
         WHERE coding_rule_value_id = p_coding_rule_value_id
           AND random_value = v_random_value;
        v_count_value := v_count_value + 1;
      EXCEPTION
        WHEN no_data_found THEN
          --v_count_value=200;
          RETURN v_random_value;
      END;
    END LOOP;
  
    IF v_count_value > 100 THEN
      RAISE e_create_random_error;
    END IF;
  
  EXCEPTION
    WHEN e_create_random_error THEN
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => 'FND_CREATE_RANDOM_VALUE.ERROR',
                                                      p_created_by              => p_user_id,
                                                      p_package_name            => 'fnd_code_rule_pkg',
                                                      p_procedure_function_name => 'get_random_value');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'fnd_code_rule_pkg',
                                                     p_procedure_function_name => 'get_random_value');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
    
  END get_random_value;

  --获取编码规则当前值
  FUNCTION get_current_value(p_coding_rule_id NUMBER,
                             p_company_id     NUMBER,
                             p_business_group VARCHAR2,
                             p_year           NUMBER,
                             p_month          VARCHAR2,
                             p_day            VARCHAR2,
                             p_period_name    VARCHAR2) RETURN NUMBER IS
  
    v_current_value fnd_coding_rule_values.current_value%TYPE;
  
  BEGIN
    SELECT current_value
      INTO v_current_value
      FROM fnd_coding_rule_values v
     WHERE coding_rule_id = p_coding_rule_id
       AND (company_id = p_company_id OR (company_id IS NULL AND p_company_id IS NULL))
       AND (business_group = p_business_group OR (business_group IS NULL AND p_business_group IS NULL))
       AND (v.year = p_year OR (v.year IS NULL AND p_year IS NULL))
       AND (period_name = p_period_name OR (period_name IS NULL AND p_period_name IS NULL))
       AND (v.month = p_month OR (v.month IS NULL AND p_month IS NULL))
       AND (v.day = p_day OR (v.day IS NULL AND p_day IS NULL));
  
    RETURN v_current_value;
  EXCEPTION
    WHEN no_data_found THEN
      RETURN NULL;
  END get_current_value;

  --获取编码规则当前值
  PROCEDURE get_coding_rule_value(x_current_value        OUT VARCHAR2,
                                  x_coding_rule_value_id OUT VARCHAR2,
                                  p_coding_rule_id       NUMBER,
                                  p_company_id           NUMBER,
                                  p_business_group       VARCHAR2,
                                  p_year                 NUMBER,
                                  p_month                VARCHAR2,
                                  p_day                  VARCHAR2,
                                  p_period_name          VARCHAR2) IS
  BEGIN
    SELECT v.current_value,
           v.coding_rule_value_id
      INTO x_current_value,
           x_coding_rule_value_id
      FROM fnd_coding_rule_values v
     WHERE coding_rule_id = p_coding_rule_id
       AND (company_id = p_company_id OR (company_id IS NULL AND p_company_id IS NULL))
       AND (business_group = p_business_group OR (business_group IS NULL AND p_business_group IS NULL))
       AND (v.year = p_year OR (v.year IS NULL AND p_year IS NULL))
       AND (period_name = p_period_name OR (period_name IS NULL AND p_period_name IS NULL))
       AND (v.month = p_month OR (v.month IS NULL AND p_month IS NULL))
       AND (v.day = p_day OR (v.day IS NULL AND p_day IS NULL))
       FOR UPDATE NOWAIT;
  
  EXCEPTION
    WHEN no_data_found THEN
      x_current_value        := NULL;
      x_coding_rule_value_id := NULL;
  END get_coding_rule_value;

  --获取自动编码
  FUNCTION get_rule_next_auto_num(p_rule_object_code VARCHAR2,
                                  p_business_group   VARCHAR2 DEFAULT NULL,
                                  p_company_id       NUMBER DEFAULT NULL,
                                  p_session_user_id  NUMBER) RETURN VARCHAR2 IS
  
    PRAGMA AUTONOMOUS_TRANSACTION;
  
    CURSOR cur_details(p_coding_rule_id NUMBER) IS
      SELECT t.coding_rule_detail_id,
             t.coding_rule_id,
             t.sequence,
             t.segment_type,
             t.segment_value,
             t.date_format,
             t.length,
             t.incremental,
             t.start_value,
             t.end_value
        FROM fnd_coding_rule_details t
       WHERE t.coding_rule_id = p_coding_rule_id
       ORDER BY t.sequence
         FOR UPDATE NOWAIT;
  
    v_details               cur_details%ROWTYPE;
    v_coding_rule_object_id fnd_coding_rule_objects.coding_rule_object_id%TYPE;
    v_reset_frequence       fnd_coding_rules.reset_frequence%TYPE;
    v_coding_rule_id        fnd_coding_rules.coding_rule_id%TYPE;
  
    v_length      fnd_coding_rule_details.length%TYPE;
    v_incremental fnd_coding_rule_details.incremental%TYPE;
    v_start_value fnd_coding_rule_details.start_value%TYPE;
    --v_end_date    fnd_coding_rule_details.end_value%TYPE;
  
    v_length_ran      fnd_coding_rule_details.length%TYPE;
    v_start_value_ran fnd_coding_rule_details.start_value%TYPE;
    v_end_value_ran   fnd_coding_rule_details.end_value%TYPE;
  
    v_current_value        fnd_coding_rule_values.current_value%TYPE;
    v_year                 fnd_coding_rule_values.year%TYPE;
    v_month                fnd_coding_rule_values.month%TYPE;
    v_day                  fnd_coding_rule_values.day%TYPE;
    v_period_name          fnd_coding_rule_values.period_name%TYPE;
    v_coding_rule_value_id fnd_coding_rule_values.coding_rule_value_id%TYPE;
  
    --随机值
    --v_random_value fnd_coding_rule_val_random.random_value%TYPE;
  
    --当前值
    v_cur_company_id     fnd_coding_rule_values.company_id%TYPE;
    v_cur_business_group fnd_coding_rule_values.business_group%TYPE;
  
    --分配公司计数（已取消该校验、统一使用云级）
    v_assign_count NUMBER;
  
    v_operation_date DATE;
  
    v_doc_number     VARCHAR2(500); --编码
    v_doc_number_tmp VARCHAR2(30); --临时编码
  
    e_null_error              EXCEPTION;
    e_codeing_rule_null_error EXCEPTION;
  
    v_err_msg VARCHAR2(2000);
  BEGIN
  
    v_cur_company_id     := p_company_id;
    g_company_id         := p_company_id;
    v_cur_business_group := p_business_group;
  
    --SELECT SYSDATE INTO v_operation_date FROM dual;
  
    --获取编码规则对象ID
    v_coding_rule_object_id := get_coding_rule_object_id(p_rule_object_code => p_rule_object_code);
    IF v_coding_rule_object_id IS NULL THEN
      error_log(p_message => sys_message_pkg.get_string('FND_CODING_RULE_OBJECT_NULL'), p_user_id => p_session_user_id);
      ROLLBACK;
      RETURN c_error;
    END IF;
    --获取编码规则
    v_coding_rule_id := get_coding_rule_id(p_coding_rule_object_id => v_coding_rule_object_id);
    IF v_coding_rule_id IS NULL THEN
      error_log(p_message => sys_message_pkg.get_string('FND_CODING_RULE_NULL'), p_user_id => p_session_user_id);
      ROLLBACK;
      RETURN c_error;
    END IF;
    --获取重置频率
    v_reset_frequence := get_reset_frequence(p_coding_rule_object_id => v_coding_rule_object_id);
  
    --锁表
    OPEN cur_details(v_coding_rule_id);
  
    --获取开始值、步长、位数
    --序列
    BEGIN
      SELECT length,
             incremental,
             start_value
        INTO v_length,
             v_incremental,
             v_start_value
        FROM fnd_coding_rule_details d
       WHERE d.coding_rule_id = v_coding_rule_id
         AND d.segment_type = '30';
    EXCEPTION
      WHEN no_data_found THEN
        v_length      := NULL;
        v_incremental := NULL;
        v_start_value := NULL;
    END;
  
    --获取位数、开始值、结束值
    --随机值
    BEGIN
      SELECT length,
             start_value,
             end_value
        INTO v_length_ran,
             v_start_value_ran,
             v_end_value_ran
        FROM fnd_coding_rule_details d
       WHERE d.coding_rule_id = v_coding_rule_id
         AND d.segment_type = '40';
    EXCEPTION
      WHEN no_data_found THEN
        v_length_ran      := NULL;
        v_start_value_ran := NULL;
        v_end_value_ran   := NULL;
    END;
  
    --获取系统日期
    SELECT to_date(to_char(SYSDATE, 'yyyymmdd'), 'yyyymmdd')
      INTO v_operation_date
      FROM dual;
  
    IF v_reset_frequence = 'NEVER' THEN
      v_year        := '';
      v_period_name := '';
      v_month       := '';
      v_day         := '';
    
    ELSIF v_reset_frequence = 'PERIOD' THEN
      v_year        := '';
      v_month       := '';
      v_day         := '';
      v_period_name := get_gld_period_name(p_company_id => p_company_id, p_operation_date => v_operation_date);
      IF v_period_name IS NULL THEN
        error_log(p_message => sys_message_pkg.get_string('FND_CODING_RULE_PERIOD_NAME_NULL'), p_user_id => p_session_user_id);
        RAISE e_null_error;
      END IF;
    
    ELSIF v_reset_frequence = 'YEAR' THEN
      v_period_name := '';
      v_month       := '';
      v_day         := '';
      v_year        := to_number(to_char(v_operation_date, 'YYYY'));
    ELSIF v_reset_frequence = 'MONTH' THEN
      v_period_name := '';
      v_month       := to_char(v_operation_date, 'YYYY-MM');
      v_day         := '';
      v_year        := '';
    ELSIF v_reset_frequence = 'DAY' THEN
      v_period_name := '';
      v_month       := '';
      v_day         := to_char(v_operation_date, 'YYYY-MM-DD');
      v_year        := '';
    END IF;
  
    --查看该编码规则下该公司是会否已经分配
    --取消分配公司以及生成编码时校验、只有云级编码
    /*SELECT COUNT(1)
     INTO v_assign_count
     FROM fnd_coding_rule_company a
    WHERE a.coding_rule_id = v_coding_rule_id
          AND a.company_id = p_company_id;*/
  
    get_coding_rule_value(x_current_value        => v_current_value,
                          x_coding_rule_value_id => v_coding_rule_value_id,
                          p_coding_rule_id       => v_coding_rule_id,
                          p_company_id           => NULL,
                          p_business_group       => NULL,
                          p_year                 => v_year,
                          p_month                => v_month,
                          p_day                  => v_day,
                          p_period_name          => v_period_name);
  
    /*    v_current_value        := get_current_value(p_coding_rule_id => v_coding_rule_id,
                                                p_company_id     => NULL,
                                                p_business_group => NULL,
                                                p_year           => v_year,
                                                p_month          => v_month,
                                                p_day            => v_day,
                                                p_period_name    => v_period_name);
    v_coding_rule_value_id := get_coding_rule_value_id(p_coding_rule_id => v_coding_rule_id,
                                                       p_company_id     => NULL,
                                                       p_business_group => NULL,
                                                       p_year           => v_year,
                                                       p_month          => v_month,
                                                       p_day            => v_day,
                                                       p_period_name    => v_period_name);*/
  
    IF v_current_value IS NULL OR v_coding_rule_value_id IS NULL THEN
      v_current_value := v_start_value;
    
      --如果没有数据、插入一条数据
      insert_fnd_coding_rule_values(x_coding_rule_value_id => v_coding_rule_value_id,
                                    p_coding_rule_id       => v_coding_rule_id,
                                    p_company_id           => NULL,
                                    p_business_group       => NULL,
                                    p_year                 => v_year,
                                    p_month                => v_month,
                                    p_day                  => v_day,
                                    p_period_name          => v_period_name,
                                    p_current_value        => v_current_value,
                                    p_user_id              => p_session_user_id);
      --再获取id
      /*      v_coding_rule_value_id := get_coding_rule_value_id(p_coding_rule_id => v_coding_rule_id,
                                                               p_company_id     => NULL,
                                                               p_business_group => NULL,
                                                               p_year           => v_year,
                                                               p_month          => v_month,
                                                               p_day            => v_day,
                                                               p_period_name    => v_period_name);
      */
    ELSE
      --当前值非空，判断是否达到最大位数
      IF length(v_current_value + v_incremental) > v_length THEN
        --v_current_value := v_current_value;
        error_log(p_message => sys_message_pkg.get_string('FND_CODING_RULE_SEQUENCE_MAX'), p_user_id => p_session_user_id);
        ROLLBACK;
        RETURN c_error;
      ELSE
        v_current_value := v_current_value + v_incremental;
      END IF;
    
      UPDATE fnd_coding_rule_values v
         SET v.current_value    = v_current_value,
             v.last_update_date = SYSDATE,
             v.last_updated_by  = p_session_user_id
       WHERE v.coding_rule_value_id = v_coding_rule_value_id;
    END IF;
  
    --开始循环
    LOOP
      FETCH cur_details
        INTO v_details;
      EXIT WHEN cur_details%NOTFOUND;
    
      v_doc_number_tmp := '';
    
      --自动生成编码
      --固定字符
      IF v_details.segment_type = '10' THEN
        v_doc_number_tmp := v_details.segment_value;
        --日期
      ELSIF v_details.segment_type = '20' THEN
        v_doc_number_tmp := to_char(v_operation_date, v_details.date_format);
        --序列号
      ELSIF v_details.segment_type = '30' THEN
        SELECT lpad(v_current_value, v_length, '0')
          INTO v_doc_number_tmp
          FROM dual;
        --随机数
        --v_length_ran      fnd_coding_rule_details.length%TYPE; --
        --v_start_value_ran fnd_coding_rule_details.start_value%TYPE; --
        --v_end_value_ran   fnd_coding_rule_details.end_value%TYPE; --
      ELSIF v_details.segment_type = '40' THEN
        v_doc_number_tmp := get_random_value(v_coding_rule_value_id, v_length_ran, v_start_value_ran, v_end_value_ran, p_session_user_id);
        --插入
        insert_coding_rule_val_random(v_coding_rule_value_id, v_doc_number_tmp, p_session_user_id);
        SELECT lpad(v_doc_number_tmp, v_length_ran, '0')
          INTO v_doc_number_tmp
          FROM dual;
        --公司代码
      ELSIF v_details.segment_type = '50' THEN
        v_doc_number_tmp := v_details.segment_value;
      END IF;
    
      --v_doc_number:='';
      IF v_doc_number IS NULL THEN
        v_doc_number := v_doc_number_tmp;
      ELSE
        v_doc_number := v_doc_number || v_doc_number_tmp;
      END IF;
    
    END LOOP;
    CLOSE cur_details;
  
    IF length(v_doc_number) > 30 THEN
      ROLLBACK;
      error_log(p_message => sys_message_pkg.get_string('FND_CODING_RULE_MAX_LENGTH'), p_user_id => p_session_user_id);
      --return c_max_length_error;
      RETURN c_error;
    END IF;
  
    evt_event_core_pkg.fire_event(p_event_name => 'FND_CODE_RULE_NEXT', p_event_param => NULL, p_param1 => v_doc_number, p_param2 => NULL, p_created_by => p_session_user_id);
  
    COMMIT;
  
    RETURN v_doc_number;
  
  EXCEPTION
    WHEN e_codeing_rule_null_error THEN
      IF cur_details%ISOPEN THEN
        CLOSE cur_details;
      END IF;
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => 'FND1910_CODING_RULE_NULL',
                                                      p_created_by              => p_session_user_id,
                                                      p_package_name            => 'fnd_code_rule_pkg',
                                                      p_procedure_function_name => 'get_rule_next_auto_num');
      RETURN c_error;
    WHEN e_null_error THEN
      IF cur_details%ISOPEN THEN
        CLOSE cur_details;
      END IF;
    
      ROLLBACK;
      RETURN c_error;
    WHEN OTHERS THEN
      IF cur_details%ISOPEN THEN
        CLOSE cur_details;
      END IF;
    
      v_err_msg := dbms_utility.format_error_backtrace || ' ' || SQLERRM;
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => v_err_msg,
                                                     p_created_by              => p_session_user_id,
                                                     p_package_name            => 'fnd_code_rule_pkg',
                                                     p_procedure_function_name => 'get_rule_next_auto_num');
      ROLLBACK;
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
      RETURN c_error;
    
  END get_rule_next_auto_num;

  --WEB界面查询用函数
  FUNCTION get_document_type_name(p_company_id        NUMBER,
                                  p_document_category VARCHAR2,
                                  p_document_type     VARCHAR2) RETURN VARCHAR2 IS
    v_document_type_name VARCHAR2(1000);
  BEGIN
    SELECT NAME
      INTO v_document_type_name
      FROM fnd_code_rule_document_types_v t
     WHERE t.type = p_document_category
       AND t.value = p_document_type
       AND nvl(t.company_id, p_company_id) = p_company_id;
  
    RETURN v_document_type_name;
  
  EXCEPTION
    WHEN no_data_found THEN
      RETURN NULL;
  END get_document_type_name;

  PROCEDURE load_coding_rule_object(p_rule_object_code VARCHAR2,
                                    p_rule_object_name VARCHAR2) IS
    v_coding_rule_object_id fnd_coding_rule_objects.coding_rule_object_id%TYPE;
  BEGIN
    --插入编码规则对象
    fnd_code_rule_pkg.insert_fnd_coding_rule_objects(p_rule_object_code        => p_rule_object_code,
                                                     p_rule_object_name        => p_rule_object_name,
                                                     p_rule_object_description => p_rule_object_name,
                                                     p_foundation_code         => NULL,
                                                     p_enabled_flag            => 'Y',
                                                     p_created_by              => 1,
                                                     o_coding_rule_object_id   => v_coding_rule_object_id);
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => 1,
                                                     p_package_name            => 'sys_data_load_pkg',
                                                     p_procedure_function_name => 'load_coding_rule_object');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END load_coding_rule_object;

END fnd_code_rule_pkg;
/
