CREATE OR REPLACE PACKAGE hn_cert_scene_inspection_pkg IS

  -- author  : chenglu
  -- created : 2018/9/10 21:00:25
  -- purpose : 现场考察计划

  c_hn_vendor_source_pkg CONSTANT VARCHAR2(100) := 'HN_CERT_SCENE_INSPECTION_PKG'; --包名
  c_auto_scheme_number   CONSTANT VARCHAR2(100) := 'HN_CERT_INVESTIGATION_PLAN'; --自动生成编号代码
  --状态
  c_hn_scheme_status_syscode   CONSTANT VARCHAR2(100) := 'HN_SCHEME_STATUS_SYSCODE'; --syscode
  c_hn_scheme_new_status       CONSTANT VARCHAR2(100) := 'NEW'; --新建
  c_hn_scheme_approving_status CONSTANT VARCHAR2(100) := 'APPROVING'; --审批中
  c_hn_scheme_cancelled_status CONSTANT VARCHAR2(100) := 'CANCELLED'; --已取消
  c_hn_scheme_approved_status  CONSTANT VARCHAR2(100) := 'APPROVED'; --审批通过
  c_hn_scheme_rejected_status  CONSTANT VARCHAR2(100) := 'REJECTED'; --审批拒绝

  /*************************************************
  -- author  : chenglu
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 现场考察计划创建
  **************************************************/
  PROCEDURE insert_hn_cert_plan_head(o_head_id         OUT NUMBER,
                                     p_unit_id         VARCHAR2,
                                     p_vendor_code     VARCHAR2,
                                     p_cert_start_date VARCHAR2,
                                     p_cert_end_date   VARCHAR2,
                                     p_cert_target     VARCHAR2,
                                     p_delete_falg     VARCHAR2 DEFAULT 'N',
                                     p_business_group  VARCHAR2,
                                     p_attribute1      VARCHAR2 DEFAULT NULL,
                                     p_attribute2      VARCHAR2 DEFAULT NULL,
                                     p_attribute3      VARCHAR2 DEFAULT NULL,
                                     p_attribute4      VARCHAR2 DEFAULT NULL,
                                     p_attribute5      VARCHAR2 DEFAULT NULL,
                                     p_attribute6      VARCHAR2 DEFAULT NULL,
                                     p_attribute7      VARCHAR2 DEFAULT NULL,
                                     p_attribute8      VARCHAR2 DEFAULT NULL,
                                     p_attribute9      VARCHAR2 DEFAULT NULL,
                                     p_attribute10     VARCHAR2 DEFAULT NULL,
                                     p_attribute11     VARCHAR2 DEFAULT NULL,
                                     p_attribute12     VARCHAR2 DEFAULT NULL,
                                     p_attribute13     VARCHAR2 DEFAULT NULL,
                                     p_attribute14     VARCHAR2 DEFAULT NULL,
                                     p_attribute15     VARCHAR2 DEFAULT NULL,
                                     p_attribute16     VARCHAR2 DEFAULT NULL,
                                     p_attribute17     VARCHAR2 DEFAULT NULL,
                                     p_attribute18     VARCHAR2 DEFAULT NULL,
                                     p_attribute19     VARCHAR2 DEFAULT NULL,
                                     p_attribute20     VARCHAR2 DEFAULT NULL,
                                     p_user_id         NUMBER);
  /*************************************************
  -- author  : chenglu
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 现场考察计划更新
  **************************************************/
  PROCEDURE cert_plan_head_delete(p_head_id NUMBER,
                                  p_user_id NUMBER);
  --=======================================================
  PROCEDURE update_hn_cert_plan_head(p_head_id         NUMBER,
                                     p_cert_plan_no    VARCHAR2,
                                     p_unit_id         VARCHAR2,
                                     p_vendor_code     VARCHAR2,
                                     p_cert_start_date VARCHAR2,
                                     p_cert_end_date   VARCHAR2,
                                     p_cert_target     VARCHAR2,
                                     p_delete_falg     VARCHAR2 DEFAULT 'Y',
                                     p_attribute1      VARCHAR2 DEFAULT NULL,
                                     p_attribute2      VARCHAR2 DEFAULT NULL,
                                     p_attribute3      VARCHAR2 DEFAULT NULL,
                                     p_attribute4      VARCHAR2 DEFAULT NULL,
                                     p_attribute5      VARCHAR2 DEFAULT NULL,
                                     p_attribute6      VARCHAR2 DEFAULT NULL,
                                     p_attribute7      VARCHAR2 DEFAULT NULL,
                                     p_attribute8      VARCHAR2 DEFAULT NULL,
                                     p_attribute9      VARCHAR2 DEFAULT NULL,
                                     p_attribute10     VARCHAR2 DEFAULT NULL,
                                     p_attribute11     VARCHAR2 DEFAULT NULL,
                                     p_attribute12     VARCHAR2 DEFAULT NULL,
                                     p_attribute13     VARCHAR2 DEFAULT NULL,
                                     p_attribute14     VARCHAR2 DEFAULT NULL,
                                     p_attribute15     VARCHAR2 DEFAULT NULL,
                                     p_attribute16     VARCHAR2 DEFAULT NULL,
                                     p_attribute17     VARCHAR2 DEFAULT NULL,
                                     p_attribute18     VARCHAR2 DEFAULT NULL,
                                     p_attribute19     VARCHAR2 DEFAULT NULL,
                                     p_attribute20     VARCHAR2 DEFAULT NULL,
                                     p_user_id         NUMBER);
  /*************************************************
  -- author  : chenglu
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 现场考察计划 整单删除
  **************************************************/

  PROCEDURE insert_hn_cert_plan_line(p_head_id           NUMBER,
                                     p_cert_plan_time    VARCHAR2,
                                     p_cret_paln_content VARCHAR2,
                                     p_hanergy_employee  VARCHAR2,
                                     p_supplier_employee VARCHAR2,
                                     p_cret_plan_note    VARCHAR2,
                                     p_attribute1        VARCHAR2 DEFAULT NULL,
                                     p_attribute2        VARCHAR2 DEFAULT NULL,
                                     p_attribute3        VARCHAR2 DEFAULT NULL,
                                     p_attribute4        VARCHAR2 DEFAULT NULL,
                                     p_attribute5        VARCHAR2 DEFAULT NULL,
                                     p_user_id           NUMBER);

  PROCEDURE update_hn_cert_plan_line(p_line_id           NUMBER,
                                     p_head_id           NUMBER,
                                     p_cert_plan_time    VARCHAR2,
                                     p_cret_paln_content VARCHAR2,
                                     p_hanergy_employee  VARCHAR2,
                                     p_supplier_employee VARCHAR2,
                                     p_cret_plan_note    VARCHAR2,
                                     p_attribute1        VARCHAR2 DEFAULT NULL,
                                     p_attribute2        VARCHAR2 DEFAULT NULL,
                                     p_attribute3        VARCHAR2 DEFAULT NULL,
                                     p_attribute4        VARCHAR2 DEFAULT NULL,
                                     p_attribute5        VARCHAR2 DEFAULT NULL,
                                     p_user_id           NUMBER);

  PROCEDURE delete_hn_cert_plan_line(p_line_id NUMBER,
                                     p_user_id NUMBER);

  --=======================================================
  --=======================================================
  --=======================================================
  --=======================================================

  PROCEDURE insert_hn_cert_plan_team_line(p_head_id                 NUMBER,
                                          p_unit_id                 VARCHAR2,
                                          p_unit_desc               VARCHAR2,
                                          p_cert_team_employee_name VARCHAR2,
                                          p_employee_position       VARCHAR2,
                                          p_team_leader_flag        VARCHAR2,
                                          p_attribute1              VARCHAR2 DEFAULT NULL,
                                          p_attribute2              VARCHAR2 DEFAULT NULL,
                                          p_attribute3              VARCHAR2 DEFAULT NULL,
                                          p_attribute4              VARCHAR2 DEFAULT NULL,
                                          p_attribute5              VARCHAR2 DEFAULT NULL,
                                          p_attribute6              VARCHAR2 DEFAULT NULL,
                                          p_attribute7              VARCHAR2 DEFAULT NULL,
                                          p_attribute8              VARCHAR2 DEFAULT NULL,
                                          p_attribute9              VARCHAR2 DEFAULT NULL,
                                          p_attribute10             VARCHAR2 DEFAULT NULL,
                                          p_user_id                 NUMBER);

  PROCEDURE update_hn_cert_plan_team_line(p_line_id                 NUMBER,
                                          p_head_id                 NUMBER,
                                          p_unit_id                 VARCHAR2,
                                          p_unit_desc               VARCHAR2,
                                          p_cert_team_employee_name VARCHAR2,
                                          p_employee_position       VARCHAR2,
                                          p_team_leader_flag        VARCHAR2,
                                          p_attribute1              VARCHAR2 DEFAULT NULL,
                                          p_attribute2              VARCHAR2 DEFAULT NULL,
                                          p_attribute3              VARCHAR2 DEFAULT NULL,
                                          p_attribute4              VARCHAR2 DEFAULT NULL,
                                          p_attribute5              VARCHAR2 DEFAULT NULL,
                                          p_attribute6              VARCHAR2 DEFAULT NULL,
                                          p_attribute7              VARCHAR2 DEFAULT NULL,
                                          p_attribute8              VARCHAR2 DEFAULT NULL,
                                          p_attribute9              VARCHAR2 DEFAULT NULL,
                                          p_attribute10             VARCHAR2 DEFAULT NULL,
                                          p_user_id                 NUMBER);

  PROCEDURE delete_hn_cert_plan_team_line(p_line_id NUMBER,
                                          p_user_id NUMBER);
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 审批回写：处理业务逻辑
  **************************************************/
  PROCEDURE return_opt(p_head_id    NUMBER,
                       p_opt_status VARCHAR2,
                       p_user_id    NUMBER);

  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 审批回写：拒绝
  **************************************************/
  PROCEDURE rejecte_return(p_head_id       NUMBER,
                           p_approved_note VARCHAR2 DEFAULT NULL,
                           p_user_id       NUMBER);
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 审批回写：通过
  **************************************************/
  PROCEDURE approve_return(p_head_id       NUMBER,
                           p_approved_note VARCHAR2 DEFAULT NULL,
                           p_user_id       NUMBER);

  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 取消
  **************************************************/
  PROCEDURE source_scheme_cancel(p_head_id NUMBER,
                                 p_user_id NUMBER);

  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 提交
  **************************************************/
  PROCEDURE cert_plan_submit(p_head_id NUMBER,
                             p_user_id NUMBER);

  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 现场考察计划操作：提交/取消
  **************************************************/
  PROCEDURE cert_plan_opt(p_head_id    NUMBER,
                          p_opt_status VARCHAR2,
                          p_user_id    NUMBER);
  /*************************************************
  -- author  : chenglu
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 操作记录
  **************************************************/
  PROCEDURE operation_record(p_operation_table    VARCHAR2,
                             p_operation_table_id NUMBER,
                             p_status             VARCHAR2,
                             p_status_desc        VARCHAR2,
                             p_user_id            NUMBER);
END hn_cert_scene_inspection_pkg;
/
CREATE OR REPLACE PACKAGE BODY hn_cert_scene_inspection_pkg IS

  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 现场考察计划创建
  **************************************************/
  PROCEDURE insert_hn_cert_plan_head(o_head_id         OUT NUMBER,
                                     p_unit_id         VARCHAR2,
                                     p_vendor_code     VARCHAR2,
                                     p_cert_start_date VARCHAR2,
                                     p_cert_end_date   VARCHAR2,
                                     p_cert_target     VARCHAR2,
                                     p_delete_falg     VARCHAR2 DEFAULT 'N',
                                     p_business_group  VARCHAR2,
                                     p_attribute1      VARCHAR2 DEFAULT NULL,
                                     p_attribute2      VARCHAR2 DEFAULT NULL,
                                     p_attribute3      VARCHAR2 DEFAULT NULL,
                                     p_attribute4      VARCHAR2 DEFAULT NULL,
                                     p_attribute5      VARCHAR2 DEFAULT NULL,
                                     p_attribute6      VARCHAR2 DEFAULT NULL,
                                     p_attribute7      VARCHAR2 DEFAULT NULL,
                                     p_attribute8      VARCHAR2 DEFAULT NULL,
                                     p_attribute9      VARCHAR2 DEFAULT NULL,
                                     p_attribute10     VARCHAR2 DEFAULT NULL,
                                     p_attribute11     VARCHAR2 DEFAULT NULL,
                                     p_attribute12     VARCHAR2 DEFAULT NULL,
                                     p_attribute13     VARCHAR2 DEFAULT NULL,
                                     p_attribute14     VARCHAR2 DEFAULT NULL,
                                     p_attribute15     VARCHAR2 DEFAULT NULL,
                                     p_attribute16     VARCHAR2 DEFAULT NULL,
                                     p_attribute17     VARCHAR2 DEFAULT NULL,
                                     p_attribute18     VARCHAR2 DEFAULT NULL,
                                     p_attribute19     VARCHAR2 DEFAULT NULL,
                                     p_attribute20     VARCHAR2 DEFAULT NULL,
                                     p_user_id         NUMBER) IS
    v_data               hn_cert_plan_head%ROWTYPE;
    v_scheme_status_desc VARCHAR2(100);
  BEGIN
    --编号
    v_data.cert_plan_no := fnd_code_rule_pkg.get_rule_next_auto_num(c_auto_scheme_number, NULL, NULL, p_user_id);
    --校验
  
    --赋值
    o_head_id               := hn_cert_plan_head_s.nextval;
    v_data.head_id          := o_head_id;
    v_data.unit_id          := p_unit_id;
    v_data.vendor_code      := p_vendor_code;
    v_data.cert_start_date  := to_date(p_cert_start_date, 'yyyy-mm-dd');
    v_data.cert_end_date    := to_date(p_cert_end_date, 'yyyy-mm-dd');
    v_data.cert_target      := p_cert_target;
    v_data.cert_status      := c_hn_scheme_new_status;
    v_data.delete_falg      := p_delete_falg;
    v_data.business_group   := p_business_group;
    v_data.attribute1       := p_attribute1;
    v_data.attribute2       := p_attribute2;
    v_data.attribute3       := p_attribute3;
    v_data.attribute4       := p_attribute4;
    v_data.attribute5       := p_attribute5;
    v_data.attribute6       := p_attribute6;
    v_data.attribute7       := p_attribute7;
    v_data.attribute8       := p_attribute8;
    v_data.attribute9       := p_attribute9;
    v_data.attribute10      := p_attribute10;
    v_data.attribute11      := p_attribute11;
    v_data.attribute12      := p_attribute12;
    v_data.attribute13      := p_attribute13;
    v_data.attribute14      := p_attribute14;
    v_data.attribute15      := p_attribute15;
    v_data.attribute16      := p_attribute16;
    v_data.attribute17      := p_attribute17;
    v_data.attribute18      := p_attribute18;
    v_data.attribute19      := p_attribute19;
    v_data.attribute20      := p_attribute20;
    v_data.created_by       := p_user_id;
    v_data.creation_date    := SYSDATE;
    v_data.last_updated_by  := p_user_id;
    v_data.last_update_date := SYSDATE;
    INSERT INTO hn_cert_plan_head
    VALUES v_data;
    --操作记录
    SELECT s.code_value_name
      INTO v_scheme_status_desc
      FROM sys_code_values_v s
     WHERE s.code = c_hn_scheme_status_syscode
       AND s.code_value = c_hn_scheme_new_status
       AND s.code_enabled_flag = 'Y'
       AND s.code_value_enabled_flag = 'Y';
    operation_record(p_operation_table => 'hn_cert_plan_head', p_operation_table_id => o_head_id, p_status => c_hn_scheme_new_status, p_status_desc => v_scheme_status_desc, p_user_id => p_user_id);
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'insert_hn_cert_plan_head');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END insert_hn_cert_plan_head;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 现场考察计划更新
  **************************************************/
  PROCEDURE update_hn_cert_plan_head(p_head_id         NUMBER,
                                     p_cert_plan_no    VARCHAR2,
                                     p_unit_id         VARCHAR2,
                                     p_vendor_code     VARCHAR2,
                                     p_cert_start_date VARCHAR2,
                                     p_cert_end_date   VARCHAR2,
                                     p_cert_target     VARCHAR2,
                                     p_delete_falg     VARCHAR2,
                                     p_attribute1      VARCHAR2,
                                     p_attribute2      VARCHAR2,
                                     p_attribute3      VARCHAR2,
                                     p_attribute4      VARCHAR2,
                                     p_attribute5      VARCHAR2,
                                     p_attribute6      VARCHAR2,
                                     p_attribute7      VARCHAR2,
                                     p_attribute8      VARCHAR2,
                                     p_attribute9      VARCHAR2,
                                     p_attribute10     VARCHAR2,
                                     p_attribute11     VARCHAR2,
                                     p_attribute12     VARCHAR2,
                                     p_attribute13     VARCHAR2,
                                     p_attribute14     VARCHAR2,
                                     p_attribute15     VARCHAR2,
                                     p_attribute16     VARCHAR2,
                                     p_attribute17     VARCHAR2,
                                     p_attribute18     VARCHAR2,
                                     p_attribute19     VARCHAR2,
                                     p_attribute20     VARCHAR2,
                                     p_user_id         NUMBER) IS
    v_cert_status hn_cert_plan_head.cert_status%TYPE;
    v_data        hn_cert_plan_head%ROWTYPE;
  BEGIN
    UPDATE hn_cert_plan_head t
       SET t.head_id         = p_head_id,
           t.cert_plan_no    = p_cert_plan_no,
           t.unit_id         = p_unit_id,
           t.vendor_code     = p_vendor_code,
           t.cert_start_date = to_date(p_cert_start_date, 'yyyy-mm-dd'),
           t.cert_end_date   = to_date(p_cert_end_date, 'yyyy-mm-dd'),
           t.cert_target     = p_cert_target,
           t.delete_falg     = p_delete_falg,
           
           t.attribute1       = p_attribute1,
           t.attribute2       = p_attribute2,
           t.attribute3       = p_attribute3,
           t.attribute4       = p_attribute4,
           t.attribute5       = p_attribute5,
           t.attribute6       = p_attribute6,
           t.attribute7       = p_attribute7,
           t.attribute8       = p_attribute8,
           t.attribute9       = p_attribute9,
           t.attribute10      = p_attribute10,
           t.attribute11      = p_attribute11,
           t.attribute12      = p_attribute12,
           t.attribute13      = p_attribute13,
           t.attribute14      = p_attribute14,
           t.attribute15      = p_attribute15,
           t.attribute16      = p_attribute16,
           t.attribute17      = p_attribute17,
           t.attribute18      = p_attribute18,
           t.attribute19      = p_attribute19,
           t.attribute20      = p_attribute20,
           t.last_update_date = SYSDATE,
           t.last_updated_by  = p_user_id
     WHERE t.head_id = p_head_id;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'hn_cert_scene_inspection',
                                                     p_procedure_function_name => 'update_hn_cert_plan_head');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END update_hn_cert_plan_head;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 现场考察计划 整单删除
  **************************************************/
  PROCEDURE cert_plan_head_delete(p_head_id NUMBER,
                                  p_user_id NUMBER) IS
    v_cert_plan_no VARCHAR2(100);
  BEGIN
    SELECT h.cert_plan_no
      INTO v_cert_plan_no
      FROM hn_cert_plan_head h
     WHERE h.head_id = p_head_id;
    --删除行
    DELETE FROM hn_cert_plan_line l
     WHERE l.head_id = p_head_id;
    DELETE FROM hn_cert_plan_team_line tl
     WHERE tl.head_id = p_head_id;
  
    --删除操作记录
    DELETE FROM hn_operation_records r
     WHERE upper(r.operation_table) = 'HN_CERT_PLAN_HEAD'
       AND r.operation_table_id = p_head_id;
    --删除附件
    FOR t_atta_data IN (SELECT *
                          FROM fnd_atm_attachment_multi am
                         WHERE am.table_pk_value = p_head_id
                           AND am.table_name = 'HN_CERT_PLAN_HEAD')
    LOOP
      --删除附件文档和单据关联明细表fnd_atm_attachment_multi
      DELETE FROM fnd_atm_attachment_multi am
       WHERE am.record_id = t_atta_data.record_id;
      --删除附件文档表  fnd_atm_attachment
      DELETE FROM fnd_atm_attachment aa
       WHERE aa.source_pk_value = t_atta_data.record_id;
    END LOOP;
    --删除头
    DELETE FROM hn_cert_plan_head h
     WHERE h.head_id = p_head_id;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'cert_plan_head_delete');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END cert_plan_head_delete;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 现场考察计划校验
  **************************************************/
  /*PROCEDURE source_scheme_checkbox_check(p_scheme_number VARCHAR2,
                                         
                                         p_user_id NUMBER) IS
    v_message_code VARCHAR2(100);
    e_error EXCEPTION;
  BEGIN
  
    --insert/update
    source_scheme_checkbox_save(p_scheme_number => p_scheme_number, p_user_id => p_user_id);
  
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'source_scheme_checkbox_check');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END source_scheme_checkbox_check;*/

  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 现场考察计划 checkbox 值
  **************************************************/
  /*PROCEDURE source_scheme_checkbox_save(p_scheme_number                VARCHAR2,
                                        p_reason_localization_flag     VARCHAR2,
                                        p_reason_debunker_flag         VARCHAR2,
                                        p_reason_capacity_exp_flag     VARCHAR2,
                                        p_reason_lower_cost_flag       VARCHAR2,
                                        p_reason_project_require_flag  VARCHAR2,
                                        p_reason_supplier_library_flag VARCHAR2,
                                        p_reason_improve_quality_flag  VARCHAR2,
                                        p_reason_strategic_dev_flag    VARCHAR2,
                                        p_reason_insuff_supply_flag    VARCHAR2,
                                        p_reason_others_flag           VARCHAR2,
                                        p_method_internet_query_flag   VARCHAR2,
                                        p_method_exhibition_flag       VARCHAR2,
                                        p_method_dept_recommend_flag   VARCHAR2,
                                        p_method_others_flag           VARCHAR2,
                                        p_attribute1                   VARCHAR2 DEFAULT NULL,
                                        p_attribute2                   VARCHAR2 DEFAULT NULL,
                                        p_attribute3                   VARCHAR2 DEFAULT NULL,
                                        p_attribute4                   VARCHAR2 DEFAULT NULL,
                                        p_attribute5                   VARCHAR2 DEFAULT NULL,
                                        p_attribute6                   VARCHAR2 DEFAULT NULL,
                                        p_attribute7                   VARCHAR2 DEFAULT NULL,
                                        p_attribute8                   VARCHAR2 DEFAULT NULL,
                                        p_attribute9                   VARCHAR2 DEFAULT NULL,
                                        p_attribute10                  VARCHAR2 DEFAULT NULL,
                                        p_user_id                      NUMBER) IS
    t_checkbox_data hn_source_scheme_checkbox%ROWTYPE;
    v_count         NUMBER;
  BEGIN
    SELECT COUNT(1)
      INTO v_count
      FROM hn_source_scheme_checkbox c
     WHERE c.scheme_number = p_scheme_number;
    IF v_count = 0 THEN
      --insert
      t_checkbox_data.checkbox_id                  := hn_source_scheme_checkbox_s.nextval;
      t_checkbox_data.scheme_number                := p_scheme_number;
      t_checkbox_data.reason_localization_flag     := p_reason_localization_flag;
      t_checkbox_data.reason_debunker_flag         := p_reason_debunker_flag;
      t_checkbox_data.reason_capacity_exp_flag     := p_reason_capacity_exp_flag;
      t_checkbox_data.reason_lower_cost_flag       := p_reason_lower_cost_flag;
      t_checkbox_data.reason_project_require_flag  := p_reason_project_require_flag;
      t_checkbox_data.reason_supplier_library_flag := p_reason_supplier_library_flag;
      t_checkbox_data.reason_improve_quality_flag  := p_reason_improve_quality_flag;
      t_checkbox_data.reason_strategic_dev_flag    := p_reason_strategic_dev_flag;
      t_checkbox_data.reason_insuff_supply_flag    := p_reason_insuff_supply_flag;
      t_checkbox_data.reason_others_flag           := p_reason_others_flag;
      t_checkbox_data.method_internet_query_flag   := p_method_internet_query_flag;
      t_checkbox_data.method_exhibition_flag       := p_method_exhibition_flag;
      t_checkbox_data.method_dept_recommend_flag   := p_method_dept_recommend_flag;
      t_checkbox_data.method_others_flag           := p_method_others_flag;
      t_checkbox_data.attribute1                   := p_attribute1;
      t_checkbox_data.attribute2                   := p_attribute2;
      t_checkbox_data.attribute3                   := p_attribute3;
      t_checkbox_data.attribute4                   := p_attribute4;
      t_checkbox_data.attribute5                   := p_attribute5;
      t_checkbox_data.attribute6                   := p_attribute6;
      t_checkbox_data.attribute7                   := p_attribute7;
      t_checkbox_data.attribute8                   := p_attribute8;
      t_checkbox_data.attribute9                   := p_attribute9;
      t_checkbox_data.attribute10                  := p_attribute10;
      t_checkbox_data.created_by                   := p_user_id;
      t_checkbox_data.creation_date                := SYSDATE;
      t_checkbox_data.last_updated_by              := p_user_id;
      t_checkbox_data.last_update_date             := SYSDATE;
      INSERT INTO hn_source_scheme_checkbox
      VALUES t_checkbox_data;
    ELSE
      --update
      UPDATE hn_source_scheme_checkbox t
         SET t.reason_localization_flag     = p_reason_localization_flag,
             t.reason_debunker_flag         = p_reason_debunker_flag,
             t.reason_capacity_exp_flag     = p_reason_capacity_exp_flag,
             t.reason_lower_cost_flag       = p_reason_lower_cost_flag,
             t.reason_project_require_flag  = p_reason_project_require_flag,
             t.reason_supplier_library_flag = p_reason_supplier_library_flag,
             t.reason_improve_quality_flag  = p_reason_improve_quality_flag,
             t.reason_strategic_dev_flag    = p_reason_strategic_dev_flag,
             t.reason_insuff_supply_flag    = p_reason_insuff_supply_flag,
             t.reason_others_flag           = p_reason_others_flag,
             t.method_internet_query_flag   = p_method_internet_query_flag,
             t.method_exhibition_flag       = p_method_exhibition_flag,
             t.method_dept_recommend_flag   = p_method_dept_recommend_flag,
             t.method_others_flag           = p_method_others_flag,
             t.attribute1                   = p_attribute1,
             t.attribute2                   = p_attribute2,
             t.attribute3                   = p_attribute3,
             t.attribute4                   = p_attribute4,
             t.attribute5                   = p_attribute5,
             t.attribute6                   = p_attribute6,
             t.attribute7                   = p_attribute7,
             t.attribute8                   = p_attribute8,
             t.attribute9                   = p_attribute9,
             t.attribute10                  = p_attribute10,
             t.last_update_date             = SYSDATE,
             t.last_updated_by              = p_user_id
       WHERE t.scheme_number = p_scheme_number;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'source_scheme_checkbox_save');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END source_scheme_checkbox_save;
  */

  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 现场考察计划行创建
  **************************************************/
  PROCEDURE insert_hn_cert_plan_line(p_head_id           NUMBER,
                                     p_cert_plan_time    VARCHAR2,
                                     p_cret_paln_content VARCHAR2,
                                     p_hanergy_employee  VARCHAR2,
                                     p_supplier_employee VARCHAR2,
                                     p_cret_plan_note    VARCHAR2,
                                     p_attribute1        VARCHAR2 DEFAULT NULL,
                                     p_attribute2        VARCHAR2 DEFAULT NULL,
                                     p_attribute3        VARCHAR2 DEFAULT NULL,
                                     p_attribute4        VARCHAR2 DEFAULT NULL,
                                     p_attribute5        VARCHAR2 DEFAULT NULL,
                                     p_user_id           NUMBER) IS
    v_data hn_cert_plan_line%ROWTYPE;
  BEGIN
    v_data.line_id           := hn_cert_plan_line_s.nextval;
    v_data.head_id           := p_head_id;
    v_data.cert_plan_time    := p_cert_plan_time;
    v_data.cret_paln_content := p_cret_paln_content;
    v_data.hanergy_employee  := p_hanergy_employee;
    v_data.supplier_employee := p_supplier_employee;
    v_data.cret_plan_note    := p_cret_plan_note;
    v_data.attribute1        := p_attribute1;
    v_data.attribute2        := p_attribute2;
    v_data.attribute3        := p_attribute3;
    v_data.attribute4        := p_attribute4;
    v_data.attribute5        := p_attribute5;
    v_data.created_by        := p_user_id;
    v_data.creation_date     := SYSDATE;
    v_data.last_updated_by   := p_user_id;
    v_data.last_update_date  := SYSDATE;
    INSERT INTO hn_cert_plan_line
    VALUES v_data;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'hn_cert_scene_inspection_pkg',
                                                     p_procedure_function_name => 'insert_hn_cert_plan_line');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END insert_hn_cert_plan_line;

  --==========================================================
  --procedure name  : update_hn_cert_plan_line
  --discription     :
  --note            :
  --parameter       :
  --==========================================================
  PROCEDURE update_hn_cert_plan_line(p_line_id           NUMBER,
                                     p_head_id           NUMBER,
                                     p_cert_plan_time    VARCHAR2,
                                     p_cret_paln_content VARCHAR2,
                                     p_hanergy_employee  VARCHAR2,
                                     p_supplier_employee VARCHAR2,
                                     p_cret_plan_note    VARCHAR2,
                                     p_attribute1        VARCHAR2 DEFAULT NULL,
                                     p_attribute2        VARCHAR2 DEFAULT NULL,
                                     p_attribute3        VARCHAR2 DEFAULT NULL,
                                     p_attribute4        VARCHAR2 DEFAULT NULL,
                                     p_attribute5        VARCHAR2 DEFAULT NULL,
                                     p_user_id           NUMBER) IS
    v_data hn_cert_plan_line%ROWTYPE;
  BEGIN
    UPDATE hn_cert_plan_line t
       SET t.line_id           = p_line_id,
           t.head_id           = p_head_id,
           t.cert_plan_time    = p_cert_plan_time,
           t.cret_paln_content = p_cret_paln_content,
           t.hanergy_employee  = p_hanergy_employee,
           t.supplier_employee = p_supplier_employee,
           t.cret_plan_note    = p_cret_plan_note,
           t.attribute1        = p_attribute1,
           t.attribute2        = p_attribute2,
           t.attribute3        = p_attribute3,
           t.attribute4        = p_attribute4,
           t.attribute5        = p_attribute5,
           t.last_update_date  = SYSDATE,
           t.last_updated_by   = p_user_id
     WHERE t.line_id = p_line_id;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'hn_cert_scene_inspection_pkg',
                                                     p_procedure_function_name => 'update_hn_cert_plan_line');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END update_hn_cert_plan_line;

  --==========================================================
  --procedure name  : delete_hn_cert_plan_line
  --discription     :
  --note            :
  --parameter       :
  --==========================================================
  PROCEDURE delete_hn_cert_plan_line(p_line_id NUMBER,
                                     p_user_id NUMBER) IS
  BEGIN
    DELETE FROM hn_cert_plan_line t
     WHERE t.line_id = p_line_id;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'hn_cert_scene_inspection_pkg',
                                                     p_procedure_function_name => 'delete_hn_cert_plan_line');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END delete_hn_cert_plan_line;

  --==========================================================
  --procedure name  : insert_hn_cert_plan_team_line
  --discription     :
  --note            :
  --parameter       :
  --==========================================================
  PROCEDURE insert_hn_cert_plan_team_line(p_head_id                 NUMBER,
                                          p_unit_id                 VARCHAR2,
                                          p_unit_desc               VARCHAR2,
                                          p_cert_team_employee_name VARCHAR2,
                                          p_employee_position       VARCHAR2,
                                          p_team_leader_flag        VARCHAR2,
                                          p_attribute1              VARCHAR2 DEFAULT NULL,
                                          p_attribute2              VARCHAR2 DEFAULT NULL,
                                          p_attribute3              VARCHAR2 DEFAULT NULL,
                                          p_attribute4              VARCHAR2 DEFAULT NULL,
                                          p_attribute5              VARCHAR2 DEFAULT NULL,
                                          p_attribute6              VARCHAR2 DEFAULT NULL,
                                          p_attribute7              VARCHAR2 DEFAULT NULL,
                                          p_attribute8              VARCHAR2 DEFAULT NULL,
                                          p_attribute9              VARCHAR2 DEFAULT NULL,
                                          p_attribute10             VARCHAR2 DEFAULT NULL,
                                          p_user_id                 NUMBER) IS
    v_data hn_cert_plan_team_line%ROWTYPE;
  BEGIN
    v_data.line_id                 := hn_cert_plan_team_line_s.nextval;
    v_data.head_id                 := p_head_id;
    v_data.unit_id                 := p_unit_id;
    v_data.unit_desc               := p_unit_desc;
    v_data.cert_team_employee_name := p_cert_team_employee_name;
    v_data.employee_position       := p_employee_position;
    v_data.team_leader_flag        := p_team_leader_flag;
    v_data.attribute1              := p_attribute1;
    v_data.attribute2              := p_attribute2;
    v_data.attribute3              := p_attribute3;
    v_data.attribute4              := p_attribute4;
    v_data.attribute5              := p_attribute5;
    v_data.attribute6              := p_attribute6;
    v_data.attribute7              := p_attribute7;
    v_data.attribute8              := p_attribute8;
    v_data.attribute9              := p_attribute9;
    v_data.attribute10             := p_attribute10;
    v_data.created_by              := p_user_id;
    v_data.creation_date           := SYSDATE;
    v_data.last_updated_by         := p_user_id;
    v_data.last_update_date        := SYSDATE;
    INSERT INTO hn_cert_plan_team_line
    VALUES v_data;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'hn_cert_scene_inspection_pkg',
                                                     p_procedure_function_name => 'insert_hn_cert_plan_team_line');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END insert_hn_cert_plan_team_line;

  --==========================================================
  --procedure name  : update_hn_cert_plan_team_line
  --discription     :
  --note            :
  --parameter       :
  --==========================================================
  PROCEDURE update_hn_cert_plan_team_line(p_line_id                 NUMBER,
                                          p_head_id                 NUMBER,
                                          p_unit_id                 VARCHAR2,
                                          p_unit_desc               VARCHAR2,
                                          p_cert_team_employee_name VARCHAR2,
                                          p_employee_position       VARCHAR2,
                                          p_team_leader_flag        VARCHAR2,
                                          p_attribute1              VARCHAR2 DEFAULT NULL,
                                          p_attribute2              VARCHAR2 DEFAULT NULL,
                                          p_attribute3              VARCHAR2 DEFAULT NULL,
                                          p_attribute4              VARCHAR2 DEFAULT NULL,
                                          p_attribute5              VARCHAR2 DEFAULT NULL,
                                          p_attribute6              VARCHAR2 DEFAULT NULL,
                                          p_attribute7              VARCHAR2 DEFAULT NULL,
                                          p_attribute8              VARCHAR2 DEFAULT NULL,
                                          p_attribute9              VARCHAR2 DEFAULT NULL,
                                          p_attribute10             VARCHAR2 DEFAULT NULL,
                                          p_user_id                 NUMBER) IS
    v_data hn_cert_plan_team_line%ROWTYPE;
  BEGIN
    UPDATE hn_cert_plan_team_line t
       SET t.line_id                 = p_line_id,
           t.head_id                 = p_head_id,
           t.unit_id                 = p_unit_id,
           t.unit_desc               = p_unit_desc,
           t.cert_team_employee_name = p_cert_team_employee_name,
           t.employee_position       = p_employee_position,
           t.team_leader_flag        = p_team_leader_flag,
           t.attribute1              = p_attribute1,
           t.attribute2              = p_attribute2,
           t.attribute3              = p_attribute3,
           t.attribute4              = p_attribute4,
           t.attribute5              = p_attribute5,
           t.attribute6              = p_attribute6,
           t.attribute7              = p_attribute7,
           t.attribute8              = p_attribute8,
           t.attribute9              = p_attribute9,
           t.attribute10             = p_attribute10,
           t.last_update_date        = SYSDATE,
           t.last_updated_by         = p_user_id
     WHERE t.line_id = p_line_id;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'hn_cert_scene_inspection_pkg',
                                                     p_procedure_function_name => 'update_hn_cert_plan_team_line');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END update_hn_cert_plan_team_line;

  --==========================================================
  --procedure name  : delete_hn_cert_plan_team_line
  --discription     :
  --note            :
  --parameter       :
  --==========================================================
  PROCEDURE delete_hn_cert_plan_team_line(p_line_id NUMBER,
                                          p_user_id NUMBER) IS
  BEGIN
    DELETE FROM hn_cert_plan_team_line t
     WHERE t.line_id = p_line_id;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'hn_cert_scene_inspection_pkg',
                                                     p_procedure_function_name => 'delete_hn_cert_plan_team_line');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END delete_hn_cert_plan_team_line;

  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 现场考察计划行删除
  **************************************************/
  /*PROCEDURE source_scheme_line_delete(p_line_id NUMBER,
                                      p_user_id NUMBER) IS
  BEGIN
    DELETE FROM hn_source_scheme_line l
     WHERE l.line_id = p_line_id;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'source_scheme_line_delete');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END source_scheme_line_delete;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 现场考察计划行校验
  **************************************************/
  /*PROCEDURE source_scheme_line_check(p_head_id NUMBER,
                                     p_user_id NUMBER) IS
    v_count NUMBER;
    e_error EXCEPTION;
    v_member_type_desc VARCHAR2(100);
    v_message          VARCHAR2(100);
  BEGIN
    FOR t_line_data IN (SELECT DISTINCT l.member_type_code
                          FROM hn_source_scheme_line l
                         WHERE l.head_id = p_head_id)
    LOOP
      SELECT s.code_value_name
        INTO v_member_type_desc
        FROM sys_code_values_v s
       WHERE s.code = c_hn_member_type_syscode
         AND s.code_value = t_line_data.member_type_code
         AND s.code_enabled_flag = 'Y'
         AND s.code_value_enabled_flag = 'Y';
      --校验是否有重复维护
      SELECT COUNT(1)
        INTO v_count
        FROM (SELECT COUNT(1)
                FROM hn_source_scheme_line l
               WHERE l.head_id = p_head_id
                 AND l.member_type_code = t_line_data.member_type_code
               GROUP BY l.member_type_code,
                        l.member_user_id
              HAVING COUNT(1) > 1) v;
      IF v_count > 0 THEN
        v_message := 'HN_FND_VENDOR_SOURCE_MEMBER_UNIQUE_ERROR';
        RAISE e_error;
      END IF;
      --校验是否维护组长
      SELECT COUNT(1)
        INTO v_count
        FROM hn_source_scheme_line l
       WHERE l.head_id = p_head_id
         AND nvl(l.team_leader_flag, 'N') = 'Y'
         AND l.member_type_code = t_line_data.member_type_code;
      IF v_count = 0 THEN
        v_message := 'HN_FND_VENDOR_SOURCE_NO_LEADER_ERROR';
        RAISE e_error;
      END IF;
      --校验组长个数
      IF v_count > 1 THEN
        v_message := 'HN_FND_VENDOR_SOURCE_LEADER_EXISTED_ERROR';
        RAISE e_error;
      END IF;
    END LOOP;
  EXCEPTION
    WHEN e_error THEN
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => v_message,
                                                      p_created_by              => p_user_id,
                                                      p_token_1                 => '#MEMBER_TYPE_DESC',
                                                      p_token_value_1           => v_member_type_desc,
                                                      p_package_name            => c_hn_vendor_source_pkg,
                                                      p_procedure_function_name => 'source_scheme_line_check');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'source_scheme_line_check');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END source_scheme_line_check;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 现场考察计划操作：提交/取消
  **************************************************/
  PROCEDURE cert_plan_opt(p_head_id    NUMBER,
                          p_opt_status VARCHAR2,
                          p_user_id    NUMBER) IS
  BEGIN
    IF p_opt_status = c_hn_scheme_approving_status THEN
      --提交操作
      cert_plan_submit(p_head_id => p_head_id, p_user_id => p_user_id);
    ELSIF p_opt_status = c_hn_scheme_cancelled_status THEN
      --取消操作
      source_scheme_cancel(p_head_id => p_head_id, p_user_id => p_user_id);
    ELSIF p_opt_status = 'DELETED' THEN
      --删除操作
      cert_plan_head_delete(p_head_id => p_head_id, p_user_id => p_user_id);
    END IF;
  END cert_plan_opt;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 提交
  **************************************************/
  PROCEDURE cert_plan_submit(p_head_id NUMBER,
                             p_user_id NUMBER) IS
    v_scheme_status_desc VARCHAR2(100);
    v_company_id         VARCHAR2(100);
    e_error EXCEPTION;
    t_head_data          hn_cert_plan_head%ROWTYPE;
    v_approved_procedure VARCHAR2(100);
    v_rejected_procedure VARCHAR2(100);
  BEGIN
    SELECT company_id
    
      INTO v_company_id
      FROM fnd_companies_vl
     WHERE company_code = 'CO00000011';
    SELECT *
      INTO t_head_data
      FROM hn_cert_plan_head h
     WHERE h.head_id = p_head_id
       FOR UPDATE NOWAIT;
    --提交操作：只有新建，已拒绝 单据才能提交
    IF t_head_data.cert_status NOT IN (c_hn_scheme_new_status, c_hn_scheme_rejected_status) THEN
      SELECT listagg(s.code_value_name, '/') within GROUP(ORDER BY s.code_value_name)
        INTO v_scheme_status_desc
        FROM sys_code_values_v s
       WHERE s.code = c_hn_scheme_status_syscode
         AND s.code_value IN (c_hn_scheme_new_status, c_hn_scheme_rejected_status)
         AND s.code_enabled_flag = 'Y'
         AND s.code_value_enabled_flag = 'Y';
      RAISE e_error;
    END IF;
    --更新状态
    UPDATE hn_cert_plan_head h
       SET h.cert_status      = c_hn_scheme_approving_status,
           h.last_update_date = SYSDATE,
           h.last_updated_by  = p_user_id
     WHERE h.head_id = p_head_id;
    --操作记录
    SELECT s.code_value_name
      INTO v_scheme_status_desc
      FROM sys_code_values_v s
     WHERE s.code = c_hn_scheme_status_syscode
       AND s.code_value = c_hn_scheme_approving_status
       AND s.code_enabled_flag = 'Y'
       AND s.code_value_enabled_flag = 'Y';
    operation_record(p_operation_table    => 'hn_cert_plan_head',
                     p_operation_table_id => p_head_id,
                     p_status             => c_hn_scheme_approving_status,
                     p_status_desc        => v_scheme_status_desc,
                     p_user_id            => p_user_id);
    --功能审批 
    v_approved_procedure := 'hn_cert_scene_inspection_pkg.approve_return(' || p_head_id || ',''#P_APPROVED_NOTE#'',#P_USER_ID#);';
    v_rejected_procedure := 'hn_cert_scene_inspection_pkg.rejecte_return(' || p_head_id || ',''#P_APPROVED_NOTE#'',#P_USER_ID#);';
    sys_approve_document_pkg.action_submit(p_document_id           => p_head_id,
                                           p_document_code         => t_head_data.cert_plan_no,
                                           p_ref_table             => 'HN_CERT_PLAN_HEAD',
                                           p_approve_document_code => 'CERT_PLAN_CONFIRM',
                                           p_company_id            => v_company_id,
                                           p_title                 => t_head_data.cert_target,
                                           p_version               => 1,
                                           p_round                 => 1,
                                           p_business_group        => t_head_data.business_group,
                                           p_approved_procedure    => v_approved_procedure,
                                           p_rejected_procedure    => v_rejected_procedure,
                                           p_user_id               => p_user_id);
  EXCEPTION
    WHEN e_error THEN
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => 'HN_CERT_PLAN_STATUS_ERROR',
                                                      p_created_by              => p_user_id,
                                                      p_token_1                 => '#STATUS_DESC',
                                                      p_token_value_1           => v_scheme_status_desc,
                                                      p_package_name            => c_hn_vendor_source_pkg,
                                                      p_procedure_function_name => 'cert_plan_submit');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'cert_plan_submit');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END cert_plan_submit;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 取消
  **************************************************/
  PROCEDURE source_scheme_cancel(p_head_id NUMBER,
                                 p_user_id NUMBER) IS
    v_scheme_status      VARCHAR2(100);
    v_scheme_status_desc VARCHAR2(100);
    e_error EXCEPTION;
  BEGIN
    SELECT h.cert_status
      INTO v_scheme_status
      FROM hn_cert_plan_head h
     WHERE h.head_id = p_head_id
       FOR UPDATE NOWAIT;
    --取消操作：只有已拒绝的单据才能取消
    IF v_scheme_status <> c_hn_scheme_rejected_status THEN
      SELECT s.code_value_name
        INTO v_scheme_status_desc
        FROM sys_code_values_v s
       WHERE s.code = c_hn_scheme_status_syscode
         AND s.code_value = c_hn_scheme_rejected_status
         AND s.code_enabled_flag = 'Y'
         AND s.code_value_enabled_flag = 'Y';
      RAISE e_error;
    END IF;
    --更新状态
    UPDATE hn_cert_plan_head h
       SET h.cert_status      = c_hn_scheme_cancelled_status,
           h.last_update_date = SYSDATE,
           h.last_updated_by  = p_user_id
     WHERE h.head_id = p_head_id;
    --操作记录
    SELECT s.code_value_name
      INTO v_scheme_status_desc
      FROM sys_code_values_v s
     WHERE s.code = c_hn_scheme_status_syscode
       AND s.code_value = c_hn_scheme_cancelled_status
       AND s.code_enabled_flag = 'Y'
       AND s.code_value_enabled_flag = 'Y';
    operation_record(p_operation_table => 'cert_plan_head', p_operation_table_id => p_head_id, p_status => c_hn_scheme_cancelled_status, p_status_desc => v_scheme_status_desc, p_user_id => p_user_id);
  EXCEPTION
    WHEN e_error THEN
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => 'HN_FND_VENDOR_SOURCE_STATUS_ERROR',
                                                      p_created_by              => p_user_id,
                                                      p_token_1                 => '#STATUS_DESC',
                                                      p_token_value_1           => v_scheme_status_desc,
                                                      p_package_name            => c_hn_vendor_source_pkg,
                                                      p_procedure_function_name => 'source_scheme_cancel');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'source_scheme_cancel');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END source_scheme_cancel;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 审批回写：通过
  **************************************************/
  PROCEDURE approve_return(p_head_id       NUMBER,
                           p_approved_note VARCHAR2 DEFAULT NULL,
                           p_user_id       NUMBER) IS
  BEGIN
    return_opt(p_head_id => p_head_id, p_opt_status => c_hn_scheme_approved_status, p_user_id => p_user_id);
  END approve_return;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 审批回写：拒绝
  **************************************************/
  PROCEDURE rejecte_return(p_head_id       NUMBER,
                           p_approved_note VARCHAR2 DEFAULT NULL,
                           p_user_id       NUMBER) IS
  BEGIN
    return_opt(p_head_id => p_head_id, p_opt_status => c_hn_scheme_rejected_status, p_user_id => p_user_id);
  END rejecte_return;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 审批回写：处理业务逻辑
  **************************************************/
  PROCEDURE return_opt(p_head_id    NUMBER,
                       p_opt_status VARCHAR2,
                       p_user_id    NUMBER) IS
    v_scheme_status_desc VARCHAR2(100);
  BEGIN
    --更新状态
    UPDATE hn_cert_plan_head h
       SET h.cert_status      = p_opt_status,
           h.last_update_date = SYSDATE,
           h.last_updated_by  = p_user_id
     WHERE h.head_id = p_head_id;
    --操作记录 
    SELECT s.code_value_name
      INTO v_scheme_status_desc
      FROM sys_code_values_v s
     WHERE s.code = c_hn_scheme_status_syscode
       AND s.code_value = p_opt_status
       AND s.code_enabled_flag = 'Y'
       AND s.code_value_enabled_flag = 'Y';
    operation_record(p_operation_table => 'hn_cert_plan_head', p_operation_table_id => p_head_id, p_status => p_opt_status, p_status_desc => v_scheme_status_desc, p_user_id => p_user_id);
  END return_opt;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 操作记录
  **************************************************/
  PROCEDURE operation_record(p_operation_table    VARCHAR2,
                             p_operation_table_id NUMBER,
                             p_status             VARCHAR2,
                             p_status_desc        VARCHAR2,
                             p_user_id            NUMBER) IS
    t_record_data hn_operation_records%ROWTYPE;
    v_user_name   VARCHAR2(100);
  BEGIN
    SELECT u.description
      INTO v_user_name
      FROM sys_user u
     WHERE u.user_id = p_user_id;
    t_record_data.record_id          := hn_operation_records_s.nextval;
    t_record_data.user_id            := p_user_id;
    t_record_data.user_name          := v_user_name;
    t_record_data.status             := p_status;
    t_record_data.status_desc        := p_status_desc;
    t_record_data.operation_desc     := '';
    t_record_data.operation_table    := p_operation_table;
    t_record_data.operation_table_id := p_operation_table_id;
    t_record_data.created_by         := p_user_id;
    t_record_data.creation_date      := SYSDATE;
    t_record_data.last_updated_by    := p_user_id;
    t_record_data.last_update_date   := SYSDATE;
    INSERT INTO hn_operation_records
    VALUES t_record_data;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'operation_record');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END operation_record;
END hn_cert_scene_inspection_pkg;
/
