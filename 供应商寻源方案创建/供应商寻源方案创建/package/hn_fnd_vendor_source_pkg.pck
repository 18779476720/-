create or replace package hn_fnd_vendor_source_pkg is

  -- author  : 张大大
  -- created : 2018/9/10 21:00:25
  -- purpose : 供应商寻源包

  c_hn_vendor_source_pkg constant varchar2(100) := 'HN_FND_VENDOR_SOURCE_PKG'; --包名
  c_auto_scheme_number   constant varchar2(100) := 'HN_FND_SOURCE_SCHEME_NUMBER'; --自动生成编号代码
  --状态
  c_hn_scheme_status_syscode   constant varchar2(100) := 'HN_SCHEME_STATUS_SYSCODE'; --syscode
  c_hn_scheme_new_status       constant varchar2(100) := 'NEW'; --新建
  c_hn_scheme_approving_status constant varchar2(100) := 'APPROVING'; --审批中
  c_hn_scheme_cancelled_status constant varchar2(100) := 'CANCELLED'; --已取消
  c_hn_scheme_approved_status  constant varchar2(100) := 'APPROVED'; --审批通过
  c_hn_scheme_rejected_status  constant varchar2(100) := 'REJECTED'; --审批拒绝

  --方案类型
  c_hn_scheme_type_syscode     constant varchar2(100) := 'HN_SCHEME_TYPE_SYSCODE'; --syscode
  c_hn_scheme_type_equipment   constant varchar2(100) := 'EQUIPMENT'; --装备供应商寻源方案
  c_hn_scheme_type_manufacture constant varchar2(100) := 'MANUFACTURE'; --制造供应商寻源方案
  c_hn_scheme_type_application constant varchar2(100) := 'APPLICATION_PRODUCT'; --应用产品供应商寻源方案
  c_hn_scheme_type_mining      constant varchar2(100) := 'MINING'; --间采供应商寻源方案

  -- 行成员类型
  c_hn_member_type_syscode    constant varchar2(100) := 'HN_MEMBER_TYPE_SYSCODE'; --syscode
  c_hn_member_type_purchase   constant varchar2(100) := 'PURCHASE'; --采购
  c_hn_member_type_technology constant varchar2(100) := 'TECHNOLOGY'; --技术
  c_hn_member_type_quality    constant varchar2(100) := 'QUALITY'; --质量
  c_hn_member_type_audit      constant varchar2(100) := 'MONITORING_AUDIT'; --监察审计
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案创建
  **************************************************/
  procedure source_scheme_head_inert(o_head_id                      out number,
                                     p_scheme_title                 varchar2,
                                     p_company_id                   number,
                                     p_unit_id                      number,
                                     p_scheme_type_code             varchar2,
                                     p_production_line              varchar2,
                                     p_category_id                  number,
                                     p_item_id                      number,
                                     p_item_type_code               varchar2,
                                     p_source_reason_code           varchar2,
                                     p_vendor_reason_remark         varchar2,
                                     p_source_background_info       varchar2,
                                     p_source_quantity              number,
                                     p_vendor_type_code             varchar2,
                                     p_vendor_type_remark           varchar2,
                                     p_potential_vendor_quantity    number,
                                     p_potential_vendor_list        varchar2,
                                     p_potential_vendor_source      varchar2,
                                     p_potential_vendor_method      varchar2,
                                     p_vendor_method_remark         varchar2,
                                     p_reason_localization_flag     varchar2 default 'N',
                                     p_reason_debunker_flag         varchar2 default 'N',
                                     p_reason_capacity_exp_flag     varchar2 default 'N',
                                     p_reason_lower_cost_flag       varchar2 default 'N',
                                     p_reason_project_require_flag  varchar2 default 'N',
                                     p_reason_supplier_library_flag varchar2 default 'N',
                                     p_reason_improve_quality_flag  varchar2 default 'N',
                                     p_reason_strategic_dev_flag    varchar2 default 'N',
                                     p_reason_insuff_supply_flag    varchar2 default 'N',
                                     p_reason_others_flag           varchar2 default 'N',
                                     p_method_internet_query_flag   varchar2 default 'N',
                                     p_method_exhibition_flag       varchar2 default 'N',
                                     p_method_dept_recommend_flag   varchar2 default 'N',
                                     p_method_others_flag           varchar2 default 'N',
                                     p_business_group               varchar2,
                                     p_attribute1                   varchar2 default null,
                                     p_attribute2                   varchar2 default null,
                                     p_attribute3                   varchar2 default null,
                                     p_attribute4                   varchar2 default null,
                                     p_attribute5                   varchar2 default null,
                                     p_attribute6                   varchar2 default null,
                                     p_attribute7                   varchar2 default null,
                                     p_attribute8                   varchar2 default null,
                                     p_attribute9                   varchar2 default null,
                                     p_attribute10                  varchar2 default null,
                                     p_user_id                      number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案更新
  **************************************************/
  procedure source_scheme_head_update(p_head_id                      number,
                                      p_scheme_number                varchar2,
                                      p_scheme_title                 varchar2,
                                      p_company_id                   number,
                                      p_unit_id                      number,
                                      p_scheme_type_code             varchar2,
                                      p_production_line              varchar2,
                                      p_category_id                  number,
                                      p_item_id                      number,
                                      p_item_type_code               varchar2,
                                      p_source_reason_code           varchar2,
                                      p_vendor_reason_remark         varchar2,
                                      p_source_background_info       varchar2,
                                      p_source_quantity              number,
                                      p_vendor_type_code             varchar2,
                                      p_vendor_type_remark           varchar2,
                                      p_potential_vendor_quantity    number,
                                      p_potential_vendor_list        varchar2,
                                      p_potential_vendor_source      varchar2,
                                      p_potential_vendor_method      varchar2,
                                      p_vendor_method_remark         varchar2,
                                      p_reason_localization_flag     varchar2 default 'N',
                                      p_reason_debunker_flag         varchar2 default 'N',
                                      p_reason_capacity_exp_flag     varchar2 default 'N',
                                      p_reason_lower_cost_flag       varchar2 default 'N',
                                      p_reason_project_require_flag  varchar2 default 'N',
                                      p_reason_supplier_library_flag varchar2 default 'N',
                                      p_reason_improve_quality_flag  varchar2 default 'N',
                                      p_reason_strategic_dev_flag    varchar2 default 'N',
                                      p_reason_insuff_supply_flag    varchar2 default 'N',
                                      p_reason_others_flag           varchar2 default 'N',
                                      p_method_internet_query_flag   varchar2 default 'N',
                                      p_method_exhibition_flag       varchar2 default 'N',
                                      p_method_dept_recommend_flag   varchar2 default 'N',
                                      p_method_others_flag           varchar2 default 'N',
                                      p_attribute1                   varchar2 default null,
                                      p_attribute2                   varchar2 default null,
                                      p_attribute3                   varchar2 default null,
                                      p_attribute4                   varchar2 default null,
                                      p_attribute5                   varchar2 default null,
                                      p_attribute6                   varchar2 default null,
                                      p_attribute7                   varchar2 default null,
                                      p_attribute8                   varchar2 default null,
                                      p_attribute9                   varchar2 default null,
                                      p_attribute10                  varchar2 default null,
                                      p_user_id                      number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案 整单删除
  **************************************************/
  procedure source_scheme_head_delete(p_head_id number, p_user_id number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案校验
  **************************************************/
  procedure source_scheme_checkbox_check(p_scheme_number                varchar2,
                                         p_reason_localization_flag     varchar2,
                                         p_reason_debunker_flag         varchar2,
                                         p_reason_capacity_exp_flag     varchar2,
                                         p_reason_lower_cost_flag       varchar2,
                                         p_reason_project_require_flag  varchar2,
                                         p_reason_supplier_library_flag varchar2,
                                         p_reason_improve_quality_flag  varchar2,
                                         p_reason_strategic_dev_flag    varchar2,
                                         p_reason_insuff_supply_flag    varchar2,
                                         p_reason_others_flag           varchar2,
                                         p_method_internet_query_flag   varchar2,
                                         p_method_exhibition_flag       varchar2,
                                         p_method_dept_recommend_flag   varchar2,
                                         p_method_others_flag           varchar2,
                                         p_user_id                      number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案 checkbox 值
  **************************************************/
  procedure source_scheme_checkbox_save(p_scheme_number                varchar2,
                                        p_reason_localization_flag     varchar2,
                                        p_reason_debunker_flag         varchar2,
                                        p_reason_capacity_exp_flag     varchar2,
                                        p_reason_lower_cost_flag       varchar2,
                                        p_reason_project_require_flag  varchar2,
                                        p_reason_supplier_library_flag varchar2,
                                        p_reason_improve_quality_flag  varchar2,
                                        p_reason_strategic_dev_flag    varchar2,
                                        p_reason_insuff_supply_flag    varchar2,
                                        p_reason_others_flag           varchar2,
                                        p_method_internet_query_flag   varchar2,
                                        p_method_exhibition_flag       varchar2,
                                        p_method_dept_recommend_flag   varchar2,
                                        p_method_others_flag           varchar2,
                                        p_attribute1                   varchar2 default null,
                                        p_attribute2                   varchar2 default null,
                                        p_attribute3                   varchar2 default null,
                                        p_attribute4                   varchar2 default null,
                                        p_attribute5                   varchar2 default null,
                                        p_attribute6                   varchar2 default null,
                                        p_attribute7                   varchar2 default null,
                                        p_attribute8                   varchar2 default null,
                                        p_attribute9                   varchar2 default null,
                                        p_attribute10                  varchar2 default null,
                                        p_user_id                      number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案行创建
  **************************************************/
  procedure source_scheme_line_insert(p_head_id          number,
                                      p_line_num         number,
                                      p_member_type_code varchar2,
                                      p_member_user_id   number,
                                      p_team_leader_flag varchar2,
                                      p_attribute1       varchar2 default null,
                                      p_attribute2       varchar2 default null,
                                      p_attribute3       varchar2 default null,
                                      p_attribute4       varchar2 default null,
                                      p_attribute5       varchar2 default null,
                                      p_attribute6       varchar2 default null,
                                      p_attribute7       varchar2 default null,
                                      p_attribute8       varchar2 default null,
                                      p_attribute9       varchar2 default null,
                                      p_attribute10      varchar2 default null,
                                      p_user_id          number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案行更新
  **************************************************/
  procedure source_scheme_line_update(p_line_id          number,
                                      p_member_type_code varchar2,
                                      p_member_user_id   number,
                                      p_team_leader_flag varchar2,
                                      p_attribute1       varchar2 default null,
                                      p_attribute2       varchar2 default null,
                                      p_attribute3       varchar2 default null,
                                      p_attribute4       varchar2 default null,
                                      p_attribute5       varchar2 default null,
                                      p_attribute6       varchar2 default null,
                                      p_attribute7       varchar2 default null,
                                      p_attribute8       varchar2 default null,
                                      p_attribute9       varchar2 default null,
                                      p_attribute10      varchar2 default null,
                                      p_user_id          number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案行删除
  **************************************************/
  procedure source_scheme_line_delete(p_line_id number, p_user_id number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案行校验
  **************************************************/
  procedure source_scheme_line_check(p_head_id number, p_user_id number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案操作：提交/取消
  **************************************************/
  procedure source_scheme_opt(p_head_id    number,
                              p_opt_status varchar2,
                              p_user_id    number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 提交
  **************************************************/
  procedure source_scheme_submit(p_head_id number, p_user_id number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 取消
  **************************************************/
  procedure source_scheme_cancel(p_head_id number, p_user_id number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 审批回写：通过
  **************************************************/
  procedure approve_return(p_head_id       number,
                           p_approved_note varchar2 default null,
                           p_user_id       number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 审批回写：拒绝
  **************************************************/
  procedure rejecte_return(p_head_id       number,
                           p_approved_note varchar2 default null,
                           p_user_id       number);

  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 审批回写：处理业务逻辑
  **************************************************/
  procedure return_opt(p_head_id    number,
                       p_opt_status varchar2,
                       p_user_id    number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 操作记录
  **************************************************/
  procedure operation_record(p_operation_table    varchar2,
                             p_operation_table_id number,
                             p_status             varchar2,
                             p_status_desc        varchar2,
                             p_user_id            number);
end hn_fnd_vendor_source_pkg;
/
create or replace package body hn_fnd_vendor_source_pkg is

  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案创建
  **************************************************/
  procedure source_scheme_head_inert(o_head_id                      out number,
                                     p_scheme_title                 varchar2,
                                     p_company_id                   number,
                                     p_unit_id                      number,
                                     p_scheme_type_code             varchar2,
                                     p_production_line              varchar2,
                                     p_category_id                  number,
                                     p_item_id                      number,
                                     p_item_type_code               varchar2,
                                     p_source_reason_code           varchar2,
                                     p_vendor_reason_remark         varchar2,
                                     p_source_background_info       varchar2,
                                     p_source_quantity              number,
                                     p_vendor_type_code             varchar2,
                                     p_vendor_type_remark           varchar2,
                                     p_potential_vendor_quantity    number,
                                     p_potential_vendor_list        varchar2,
                                     p_potential_vendor_source      varchar2,
                                     p_potential_vendor_method      varchar2,
                                     p_vendor_method_remark         varchar2,
                                     p_reason_localization_flag     varchar2 default 'N',
                                     p_reason_debunker_flag         varchar2 default 'N',
                                     p_reason_capacity_exp_flag     varchar2 default 'N',
                                     p_reason_lower_cost_flag       varchar2 default 'N',
                                     p_reason_project_require_flag  varchar2 default 'N',
                                     p_reason_supplier_library_flag varchar2 default 'N',
                                     p_reason_improve_quality_flag  varchar2 default 'N',
                                     p_reason_strategic_dev_flag    varchar2 default 'N',
                                     p_reason_insuff_supply_flag    varchar2 default 'N',
                                     p_reason_others_flag           varchar2 default 'N',
                                     p_method_internet_query_flag   varchar2 default 'N',
                                     p_method_exhibition_flag       varchar2 default 'N',
                                     p_method_dept_recommend_flag   varchar2 default 'N',
                                     p_method_others_flag           varchar2 default 'N',
                                     p_business_group               varchar2,
                                     p_attribute1                   varchar2 default null,
                                     p_attribute2                   varchar2 default null,
                                     p_attribute3                   varchar2 default null,
                                     p_attribute4                   varchar2 default null,
                                     p_attribute5                   varchar2 default null,
                                     p_attribute6                   varchar2 default null,
                                     p_attribute7                   varchar2 default null,
                                     p_attribute8                   varchar2 default null,
                                     p_attribute9                   varchar2 default null,
                                     p_attribute10                  varchar2 default null,
                                     p_user_id                      number) is
    t_head_data          hn_source_scheme_head%rowtype;
    v_scheme_status_desc varchar2(100);
  begin
    --编号
    t_head_data.scheme_number := fnd_code_rule_pkg.get_rule_next_auto_num(c_auto_scheme_number,
                                                                          null,
                                                                          null,
                                                                          p_user_id);
    --校验
    source_scheme_checkbox_check(p_scheme_number                => t_head_data.scheme_number,
                                 p_reason_localization_flag     => p_reason_localization_flag,
                                 p_reason_debunker_flag         => p_reason_debunker_flag,
                                 p_reason_capacity_exp_flag     => p_reason_capacity_exp_flag,
                                 p_reason_lower_cost_flag       => p_reason_lower_cost_flag,
                                 p_reason_project_require_flag  => p_reason_project_require_flag,
                                 p_reason_supplier_library_flag => p_reason_supplier_library_flag,
                                 p_reason_improve_quality_flag  => p_reason_improve_quality_flag,
                                 p_reason_strategic_dev_flag    => p_reason_strategic_dev_flag,
                                 p_reason_insuff_supply_flag    => p_reason_insuff_supply_flag,
                                 p_reason_others_flag           => p_reason_others_flag,
                                 p_method_internet_query_flag   => p_method_internet_query_flag,
                                 p_method_exhibition_flag       => p_method_exhibition_flag,
                                 p_method_dept_recommend_flag   => p_method_dept_recommend_flag,
                                 p_method_others_flag           => p_method_others_flag,
                                 p_user_id                      => p_user_id);
    --赋值
    o_head_id           := hn_source_scheme_head_s.nextval;
    t_head_data.head_id := o_head_id;
  
    t_head_data.scheme_status             := c_hn_scheme_new_status;
    t_head_data.scheme_title              := p_scheme_title;
    t_head_data.company_id                := p_company_id;
    t_head_data.unit_id                   := p_unit_id;
    t_head_data.scheme_type_code          := p_scheme_type_code;
    t_head_data.production_line           := p_production_line;
    t_head_data.category_id               := p_category_id;
    t_head_data.item_id                   := p_item_id;
    t_head_data.item_type_code            := p_item_type_code;
    t_head_data.source_reason_code        := p_source_reason_code;
    t_head_data.vendor_reason_remark      := p_vendor_reason_remark;
    t_head_data.source_background_info    := p_source_background_info;
    t_head_data.source_quantity           := p_source_quantity;
    t_head_data.vendor_type_code          := p_vendor_type_code;
    t_head_data.vendor_type_remark        := p_vendor_type_remark;
    t_head_data.potential_vendor_quantity := p_potential_vendor_quantity;
    t_head_data.potential_vendor_list     := p_potential_vendor_list;
    t_head_data.potential_vendor_source   := p_potential_vendor_source;
    t_head_data.potential_vendor_method   := p_potential_vendor_method;
    t_head_data.vendor_method_remark      := p_vendor_method_remark;
    t_head_data.business_group            := p_business_group;
    t_head_data.attribute1                := p_attribute1;
    t_head_data.attribute2                := p_attribute2;
    t_head_data.attribute3                := p_attribute3;
    t_head_data.attribute4                := p_attribute4;
    t_head_data.attribute5                := p_attribute5;
    t_head_data.attribute6                := p_attribute6;
    t_head_data.attribute7                := p_attribute7;
    t_head_data.attribute8                := p_attribute8;
    t_head_data.attribute9                := p_attribute9;
    t_head_data.attribute10               := p_attribute10;
    t_head_data.created_by                := p_user_id;
    t_head_data.creation_date             := sysdate;
    t_head_data.last_updated_by           := p_user_id;
    t_head_data.last_update_date          := sysdate;
    insert into hn_source_scheme_head values t_head_data;
    --操作记录
    select s.code_value_name
      into v_scheme_status_desc
      from sys_code_values_v s
     where s.code = c_hn_scheme_status_syscode
       and s.code_value = c_hn_scheme_new_status
       and s.code_enabled_flag = 'Y'
       and s.code_value_enabled_flag = 'Y';
    operation_record(p_operation_table    => 'hn_source_scheme_head',
                     p_operation_table_id => o_head_id,
                     p_status             => c_hn_scheme_new_status,
                     p_status_desc        => v_scheme_status_desc,
                     p_user_id            => p_user_id);
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'source_scheme_head_inert');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end source_scheme_head_inert;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案更新
  **************************************************/
  procedure source_scheme_head_update(p_head_id                      number,
                                      p_scheme_number                varchar2,
                                      p_scheme_title                 varchar2,
                                      p_company_id                   number,
                                      p_unit_id                      number,
                                      p_scheme_type_code             varchar2,
                                      p_production_line              varchar2,
                                      p_category_id                  number,
                                      p_item_id                      number,
                                      p_item_type_code               varchar2,
                                      p_source_reason_code           varchar2,
                                      p_vendor_reason_remark         varchar2,
                                      p_source_background_info       varchar2,
                                      p_source_quantity              number,
                                      p_vendor_type_code             varchar2,
                                      p_vendor_type_remark           varchar2,
                                      p_potential_vendor_quantity    number,
                                      p_potential_vendor_list        varchar2,
                                      p_potential_vendor_source      varchar2,
                                      p_potential_vendor_method      varchar2,
                                      p_vendor_method_remark         varchar2,
                                      p_reason_localization_flag     varchar2 default 'N',
                                      p_reason_debunker_flag         varchar2 default 'N',
                                      p_reason_capacity_exp_flag     varchar2 default 'N',
                                      p_reason_lower_cost_flag       varchar2 default 'N',
                                      p_reason_project_require_flag  varchar2 default 'N',
                                      p_reason_supplier_library_flag varchar2 default 'N',
                                      p_reason_improve_quality_flag  varchar2 default 'N',
                                      p_reason_strategic_dev_flag    varchar2 default 'N',
                                      p_reason_insuff_supply_flag    varchar2 default 'N',
                                      p_reason_others_flag           varchar2 default 'N',
                                      p_method_internet_query_flag   varchar2 default 'N',
                                      p_method_exhibition_flag       varchar2 default 'N',
                                      p_method_dept_recommend_flag   varchar2 default 'N',
                                      p_method_others_flag           varchar2 default 'N',
                                      p_attribute1                   varchar2 default null,
                                      p_attribute2                   varchar2 default null,
                                      p_attribute3                   varchar2 default null,
                                      p_attribute4                   varchar2 default null,
                                      p_attribute5                   varchar2 default null,
                                      p_attribute6                   varchar2 default null,
                                      p_attribute7                   varchar2 default null,
                                      p_attribute8                   varchar2 default null,
                                      p_attribute9                   varchar2 default null,
                                      p_attribute10                  varchar2 default null,
                                      p_user_id                      number) is
  begin
    --校验
    source_scheme_checkbox_check(p_scheme_number                => p_scheme_number,
                                 p_reason_localization_flag     => p_reason_localization_flag,
                                 p_reason_debunker_flag         => p_reason_debunker_flag,
                                 p_reason_capacity_exp_flag     => p_reason_capacity_exp_flag,
                                 p_reason_lower_cost_flag       => p_reason_lower_cost_flag,
                                 p_reason_project_require_flag  => p_reason_project_require_flag,
                                 p_reason_supplier_library_flag => p_reason_supplier_library_flag,
                                 p_reason_improve_quality_flag  => p_reason_improve_quality_flag,
                                 p_reason_strategic_dev_flag    => p_reason_strategic_dev_flag,
                                 p_reason_insuff_supply_flag    => p_reason_insuff_supply_flag,
                                 p_reason_others_flag           => p_reason_others_flag,
                                 p_method_internet_query_flag   => p_method_internet_query_flag,
                                 p_method_exhibition_flag       => p_method_exhibition_flag,
                                 p_method_dept_recommend_flag   => p_method_dept_recommend_flag,
                                 p_method_others_flag           => p_method_others_flag,
                                 p_user_id                      => p_user_id);
    update hn_source_scheme_head t
       set t.scheme_title              = p_scheme_title,
           t.company_id                = p_company_id,
           t.unit_id                   = p_unit_id,
           t.scheme_type_code          = p_scheme_type_code,
           t.production_line           = p_production_line,
           t.category_id               = p_category_id,
           t.item_id                   = p_item_id,
           t.item_type_code            = p_item_type_code,
           t.source_reason_code        = p_source_reason_code,
           t.vendor_reason_remark      = p_vendor_reason_remark,
           t.source_background_info    = p_source_background_info,
           t.source_quantity           = p_source_quantity,
           t.vendor_type_code          = p_vendor_type_code,
           t.vendor_type_remark        = p_vendor_type_remark,
           t.potential_vendor_quantity = p_potential_vendor_quantity,
           t.potential_vendor_list     = p_potential_vendor_list,
           t.potential_vendor_source   = p_potential_vendor_source,
           t.potential_vendor_method   = p_potential_vendor_method,
           t.vendor_method_remark      = p_vendor_method_remark,
           t.attribute1                = p_attribute1,
           t.attribute2                = p_attribute2,
           t.attribute3                = p_attribute3,
           t.attribute4                = p_attribute4,
           t.attribute5                = p_attribute5,
           t.attribute6                = p_attribute6,
           t.attribute7                = p_attribute7,
           t.attribute8                = p_attribute8,
           t.attribute9                = p_attribute9,
           t.attribute10               = p_attribute10,
           t.last_update_date          = sysdate,
           t.last_updated_by           = p_user_id
     where t.head_id = p_head_id;
  end source_scheme_head_update;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案 整单删除
  **************************************************/
  procedure source_scheme_head_delete(p_head_id number, p_user_id number) is
    v_scheme_number varchar2(100);
  begin
    select h.scheme_number
      into v_scheme_number
      from hn_source_scheme_head h
     where h.head_id = p_head_id;
    --删除行
    delete from hn_source_scheme_line l where l.head_id = p_head_id;
    --删除checkBox
    delete from hn_source_scheme_checkbox c
     where c.scheme_number = v_scheme_number;
    --删除操作记录
    delete from hn_operation_records r
     where upper(r.operation_table) = 'HN_SOURCE_SCHEME_HEAD'
       and r.operation_table_id = p_head_id;
    --删除附件
    for t_atta_data in (select *
                          from fnd_atm_attachment_multi am
                         where am.table_pk_value = p_head_id
                           and am.table_name = 'HN_SOURCE_SCHEME_HEAD') loop
      --删除附件文档和单据关联明细表fnd_atm_attachment_multi
      delete from fnd_atm_attachment_multi am
       where am.record_id = t_atta_data.record_id;
      --删除附件文档表  fnd_atm_attachment
      delete from fnd_atm_attachment aa
       where aa.source_pk_value = t_atta_data.record_id;
    end loop;
    --删除头
    delete from hn_source_scheme_head h where h.head_id = p_head_id;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'source_scheme_head_delete');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end source_scheme_head_delete;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案校验
  **************************************************/
  procedure source_scheme_checkbox_check(p_scheme_number                varchar2,
                                         p_reason_localization_flag     varchar2,
                                         p_reason_debunker_flag         varchar2,
                                         p_reason_capacity_exp_flag     varchar2,
                                         p_reason_lower_cost_flag       varchar2,
                                         p_reason_project_require_flag  varchar2,
                                         p_reason_supplier_library_flag varchar2,
                                         p_reason_improve_quality_flag  varchar2,
                                         p_reason_strategic_dev_flag    varchar2,
                                         p_reason_insuff_supply_flag    varchar2,
                                         p_reason_others_flag           varchar2,
                                         p_method_internet_query_flag   varchar2,
                                         p_method_exhibition_flag       varchar2,
                                         p_method_dept_recommend_flag   varchar2,
                                         p_method_others_flag           varchar2,
                                         p_user_id                      number) is
    v_message_code varchar2(100);
    e_error exception;
  begin
    --校验供应商寻找方式是否选值
    if p_method_internet_query_flag = 'N' and
       p_method_exhibition_flag = 'N' and
       p_method_dept_recommend_flag = 'N' and p_method_others_flag = 'N' then
      v_message_code := 'HN_FND_VENDOR_SOURCE_METHOD_ERROR';
      raise e_error;
    end if;
    --校验寻源原因是否选值
    if p_reason_localization_flag = 'N' and p_reason_debunker_flag = 'N' and
       p_reason_capacity_exp_flag = 'N' and p_reason_lower_cost_flag = 'N' and
       p_reason_project_require_flag = 'N' and
       p_reason_supplier_library_flag = 'N' and
       p_reason_improve_quality_flag = 'N' and
       p_reason_strategic_dev_flag = 'N' and
       p_reason_insuff_supply_flag = 'N' and p_reason_others_flag = 'N' then
      v_message_code := 'HN_FND_VENDOR_SOURCE_REASOM_ERROR';
      raise e_error;
    end if;
    --insert/update
    source_scheme_checkbox_save(p_scheme_number                => p_scheme_number,
                                p_reason_localization_flag     => p_reason_localization_flag,
                                p_reason_debunker_flag         => p_reason_debunker_flag,
                                p_reason_capacity_exp_flag     => p_reason_capacity_exp_flag,
                                p_reason_lower_cost_flag       => p_reason_lower_cost_flag,
                                p_reason_project_require_flag  => p_reason_project_require_flag,
                                p_reason_supplier_library_flag => p_reason_supplier_library_flag,
                                p_reason_improve_quality_flag  => p_reason_improve_quality_flag,
                                p_reason_strategic_dev_flag    => p_reason_strategic_dev_flag,
                                p_reason_insuff_supply_flag    => p_reason_insuff_supply_flag,
                                p_reason_others_flag           => p_reason_others_flag,
                                p_method_internet_query_flag   => p_method_internet_query_flag,
                                p_method_exhibition_flag       => p_method_exhibition_flag,
                                p_method_dept_recommend_flag   => p_method_dept_recommend_flag,
                                p_method_others_flag           => p_method_others_flag,
                                p_user_id                      => p_user_id);
  
  exception
    when e_error then
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => v_message_code,
                                                      p_created_by              => p_user_id,
                                                      p_package_name            => c_hn_vendor_source_pkg,
                                                      p_procedure_function_name => 'source_scheme_checkbox_check');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'source_scheme_checkbox_check');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end source_scheme_checkbox_check;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案 checkbox 值
  **************************************************/
  procedure source_scheme_checkbox_save(p_scheme_number                varchar2,
                                        p_reason_localization_flag     varchar2,
                                        p_reason_debunker_flag         varchar2,
                                        p_reason_capacity_exp_flag     varchar2,
                                        p_reason_lower_cost_flag       varchar2,
                                        p_reason_project_require_flag  varchar2,
                                        p_reason_supplier_library_flag varchar2,
                                        p_reason_improve_quality_flag  varchar2,
                                        p_reason_strategic_dev_flag    varchar2,
                                        p_reason_insuff_supply_flag    varchar2,
                                        p_reason_others_flag           varchar2,
                                        p_method_internet_query_flag   varchar2,
                                        p_method_exhibition_flag       varchar2,
                                        p_method_dept_recommend_flag   varchar2,
                                        p_method_others_flag           varchar2,
                                        p_attribute1                   varchar2 default null,
                                        p_attribute2                   varchar2 default null,
                                        p_attribute3                   varchar2 default null,
                                        p_attribute4                   varchar2 default null,
                                        p_attribute5                   varchar2 default null,
                                        p_attribute6                   varchar2 default null,
                                        p_attribute7                   varchar2 default null,
                                        p_attribute8                   varchar2 default null,
                                        p_attribute9                   varchar2 default null,
                                        p_attribute10                  varchar2 default null,
                                        p_user_id                      number) is
    t_checkbox_data hn_source_scheme_checkbox%rowtype;
    v_count         number;
  begin
    select count(1)
      into v_count
      from hn_source_scheme_checkbox c
     where c.scheme_number = p_scheme_number;
    if v_count = 0 then
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
      t_checkbox_data.creation_date                := sysdate;
      t_checkbox_data.last_updated_by              := p_user_id;
      t_checkbox_data.last_update_date             := sysdate;
      insert into hn_source_scheme_checkbox values t_checkbox_data;
    else
      --update
      update hn_source_scheme_checkbox t
         set t.reason_localization_flag     = p_reason_localization_flag,
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
             t.last_update_date             = sysdate,
             t.last_updated_by              = p_user_id
       where t.scheme_number = p_scheme_number;
    end if;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'source_scheme_checkbox_save');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end source_scheme_checkbox_save;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案行创建
  **************************************************/
  procedure source_scheme_line_insert(p_head_id          number,
                                      p_line_num         number,
                                      p_member_type_code varchar2,
                                      p_member_user_id   number,
                                      p_team_leader_flag varchar2,
                                      p_attribute1       varchar2 default null,
                                      p_attribute2       varchar2 default null,
                                      p_attribute3       varchar2 default null,
                                      p_attribute4       varchar2 default null,
                                      p_attribute5       varchar2 default null,
                                      p_attribute6       varchar2 default null,
                                      p_attribute7       varchar2 default null,
                                      p_attribute8       varchar2 default null,
                                      p_attribute9       varchar2 default null,
                                      p_attribute10      varchar2 default null,
                                      p_user_id          number) is
    t_line_data hn_source_scheme_line%rowtype;
  begin
    t_line_data.line_id          := hn_source_scheme_line_s.nextval;
    t_line_data.line_num         := p_line_num;
    t_line_data.head_id          := p_head_id;
    t_line_data.member_type_code := p_member_type_code;
    t_line_data.member_user_id   := p_member_user_id;
    t_line_data.team_leader_flag := p_team_leader_flag;
    t_line_data.attribute1       := p_attribute1;
    t_line_data.attribute2       := p_attribute2;
    t_line_data.attribute3       := p_attribute3;
    t_line_data.attribute4       := p_attribute4;
    t_line_data.attribute5       := p_attribute5;
    t_line_data.attribute6       := p_attribute6;
    t_line_data.attribute7       := p_attribute7;
    t_line_data.attribute8       := p_attribute8;
    t_line_data.attribute9       := p_attribute9;
    t_line_data.attribute10      := p_attribute10;
    t_line_data.created_by       := p_user_id;
    t_line_data.creation_date    := sysdate;
    t_line_data.last_updated_by  := p_user_id;
    t_line_data.last_update_date := sysdate;
    insert into hn_source_scheme_line values t_line_data;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'source_scheme_line_insert');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end source_scheme_line_insert;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案行更新
  **************************************************/
  procedure source_scheme_line_update(p_line_id          number,
                                      p_member_type_code varchar2,
                                      p_member_user_id   number,
                                      p_team_leader_flag varchar2,
                                      p_attribute1       varchar2 default null,
                                      p_attribute2       varchar2 default null,
                                      p_attribute3       varchar2 default null,
                                      p_attribute4       varchar2 default null,
                                      p_attribute5       varchar2 default null,
                                      p_attribute6       varchar2 default null,
                                      p_attribute7       varchar2 default null,
                                      p_attribute8       varchar2 default null,
                                      p_attribute9       varchar2 default null,
                                      p_attribute10      varchar2 default null,
                                      p_user_id          number) is
  begin
    update hn_source_scheme_line t
       set t.member_type_code = p_member_type_code,
           t.member_user_id   = p_member_user_id,
           t.team_leader_flag = p_team_leader_flag,
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
           t.last_update_date = sysdate,
           t.last_updated_by  = p_user_id
     where t.line_id = p_line_id;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'source_scheme_line_update');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end source_scheme_line_update;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案行删除
  **************************************************/
  procedure source_scheme_line_delete(p_line_id number, p_user_id number) is
  begin
    delete from hn_source_scheme_line l where l.line_id = p_line_id;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'source_scheme_line_delete');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end source_scheme_line_delete;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案行校验
  **************************************************/
  procedure source_scheme_line_check(p_head_id number, p_user_id number) is
    v_count number;
    e_error exception;
    v_member_type_desc varchar2(100);
    v_message          varchar2(100);
  begin
    for t_line_data in (select distinct l.member_type_code
                          from hn_source_scheme_line l
                         where l.head_id = p_head_id) loop
      select s.code_value_name
        into v_member_type_desc
        from sys_code_values_v s
       where s.code = c_hn_member_type_syscode
         and s.code_value = t_line_data.member_type_code
         and s.code_enabled_flag = 'Y'
         and s.code_value_enabled_flag = 'Y';
      --校验是否有重复维护
      select count(1)
        into v_count
        from (select count(1)
                from hn_source_scheme_line l
               where l.head_id = p_head_id
                 and l.member_type_code = t_line_data.member_type_code
               group by l.member_type_code, l.member_user_id
              having count(1) > 1) v;
      if v_count > 0 then
        v_message := 'HN_FND_VENDOR_SOURCE_MEMBER_UNIQUE_ERROR';
        raise e_error;
      end if;
      --校验是否维护组长
      select count(1)
        into v_count
        from hn_source_scheme_line l
       where l.head_id = p_head_id
         and nvl(l.team_leader_flag, 'N') = 'Y'
         and l.member_type_code = t_line_data.member_type_code;
      if v_count = 0 then
        v_message := 'HN_FND_VENDOR_SOURCE_NO_LEADER_ERROR';
        raise e_error;
      end if;
      --校验组长个数
      if v_count > 1 then
        v_message := 'HN_FND_VENDOR_SOURCE_LEADER_EXISTED_ERROR';
        raise e_error;
      end if;
    end loop;
  exception
    when e_error then
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => v_message,
                                                      p_created_by              => p_user_id,
                                                      p_token_1                 => '#MEMBER_TYPE_DESC',
                                                      p_token_value_1           => v_member_type_desc,
                                                      p_package_name            => c_hn_vendor_source_pkg,
                                                      p_procedure_function_name => 'source_scheme_line_check');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'source_scheme_line_check');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end source_scheme_line_check;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 寻源方案操作：提交/取消
  **************************************************/
  procedure source_scheme_opt(p_head_id    number,
                              p_opt_status varchar2,
                              p_user_id    number) is
  begin
    if p_opt_status = c_hn_scheme_approving_status then
      --提交操作
      source_scheme_submit(p_head_id => p_head_id, p_user_id => p_user_id);
    elsif p_opt_status = c_hn_scheme_cancelled_status then
      --取消操作
      source_scheme_cancel(p_head_id => p_head_id, p_user_id => p_user_id);
    elsif p_opt_status = 'DELETED' then
      --删除操作
      source_scheme_head_delete(p_head_id => p_head_id,
                                p_user_id => p_user_id);
    end if;
  end source_scheme_opt;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 提交
  **************************************************/
  procedure source_scheme_submit(p_head_id number, p_user_id number) is
    v_scheme_status_desc varchar2(100);
    e_error exception;
    t_head_data          hn_source_scheme_head%rowtype;
    v_approved_procedure varchar2(100);
    v_rejected_procedure varchar2(100);
  begin
    select *
      into t_head_data
      from hn_source_scheme_head h
     where h.head_id = p_head_id
       for update nowait;
    --提交操作：只有新建，已拒绝 单据才能提交
    if t_head_data.scheme_status not in
       (c_hn_scheme_new_status, c_hn_scheme_rejected_status) then
      select listagg(s.code_value_name, '/') within group(order by s.code_value_name)
        into v_scheme_status_desc
        from sys_code_values_v s
       where s.code = c_hn_scheme_status_syscode
         and s.code_value in
             (c_hn_scheme_new_status, c_hn_scheme_rejected_status)
         and s.code_enabled_flag = 'Y'
         and s.code_value_enabled_flag = 'Y';
      raise e_error;
    end if;
    --更新状态
    update hn_source_scheme_head h
       set h.scheme_status    = c_hn_scheme_approving_status,
           h.last_update_date = sysdate,
           h.last_updated_by  = p_user_id
     where h.head_id = p_head_id;
    --操作记录
    select s.code_value_name
      into v_scheme_status_desc
      from sys_code_values_v s
     where s.code = c_hn_scheme_status_syscode
       and s.code_value = c_hn_scheme_approving_status
       and s.code_enabled_flag = 'Y'
       and s.code_value_enabled_flag = 'Y';
    operation_record(p_operation_table    => 'hn_source_scheme_head',
                     p_operation_table_id => p_head_id,
                     p_status             => c_hn_scheme_approving_status,
                     p_status_desc        => v_scheme_status_desc,
                     p_user_id            => p_user_id);
    --功能审批 
    v_approved_procedure := 'hn_fnd_vendor_source_pkg.approve_return(' ||
                            p_head_id ||
                            ',''#P_APPROVED_NOTE#'',#P_USER_ID#);';
    v_rejected_procedure := 'hn_fnd_vendor_source_pkg.rejecte_return(' ||
                            p_head_id ||
                            ',''#P_APPROVED_NOTE#'',#P_USER_ID#);';
    sys_approve_document_pkg.action_submit(p_document_id           => p_head_id,
                                           p_document_code         => t_head_data.scheme_number,
                                           p_ref_table             => 'HN_SOURCE_SCHEME_HEAD',
                                           p_approve_document_code => 'FND_VENDOR_SOURCE_APPROVE',
                                           p_company_id            => t_head_data.company_id,
                                           p_title                 => t_head_data.scheme_title,
                                           p_version               => 1,
                                           p_round                 => 1,
                                           p_business_group        => t_head_data.business_group,
                                           p_approved_procedure    => v_approved_procedure,
                                           p_rejected_procedure    => v_rejected_procedure,
                                           p_user_id               => p_user_id);
  exception
    when e_error then
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => 'HN_FND_VENDOR_SOURCE_STATUS_ERROR',
                                                      p_created_by              => p_user_id,
                                                      p_token_1                 => '#STATUS_DESC',
                                                      p_token_value_1           => v_scheme_status_desc,
                                                      p_package_name            => c_hn_vendor_source_pkg,
                                                      p_procedure_function_name => 'source_scheme_submit');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'source_scheme_submit');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end source_scheme_submit;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 取消
  **************************************************/
  procedure source_scheme_cancel(p_head_id number, p_user_id number) is
    v_scheme_status      varchar2(100);
    v_scheme_status_desc varchar2(100);
    e_error exception;
  begin
    select h.scheme_status
      into v_scheme_status
      from hn_source_scheme_head h
     where h.head_id = p_head_id
       for update nowait;
    --取消操作：只有已拒绝的单据才能取消
    if v_scheme_status <> c_hn_scheme_rejected_status then
      select s.code_value_name
        into v_scheme_status_desc
        from sys_code_values_v s
       where s.code = c_hn_scheme_status_syscode
         and s.code_value = c_hn_scheme_rejected_status
         and s.code_enabled_flag = 'Y'
         and s.code_value_enabled_flag = 'Y';
      raise e_error;
    end if;
    --更新状态
    update hn_source_scheme_head h
       set h.scheme_status    = c_hn_scheme_cancelled_status,
           h.last_update_date = sysdate,
           h.last_updated_by  = p_user_id
     where h.head_id = p_head_id;
    --操作记录
    select s.code_value_name
      into v_scheme_status_desc
      from sys_code_values_v s
     where s.code = c_hn_scheme_status_syscode
       and s.code_value = c_hn_scheme_cancelled_status
       and s.code_enabled_flag = 'Y'
       and s.code_value_enabled_flag = 'Y';
    operation_record(p_operation_table    => 'lj_project_budget_head',
                     p_operation_table_id => p_head_id,
                     p_status             => c_hn_scheme_cancelled_status,
                     p_status_desc        => v_scheme_status_desc,
                     p_user_id            => p_user_id);
  exception
    when e_error then
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => 'HN_FND_VENDOR_SOURCE_STATUS_ERROR',
                                                      p_created_by              => p_user_id,
                                                      p_token_1                 => '#STATUS_DESC',
                                                      p_token_value_1           => v_scheme_status_desc,
                                                      p_package_name            => c_hn_vendor_source_pkg,
                                                      p_procedure_function_name => 'source_scheme_cancel');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'source_scheme_cancel');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end source_scheme_cancel;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 审批回写：通过
  **************************************************/
  procedure approve_return(p_head_id       number,
                           p_approved_note varchar2 default null,
                           p_user_id       number) is
  begin
    return_opt(p_head_id    => p_head_id,
               p_opt_status => c_hn_scheme_approved_status,
               p_user_id    => p_user_id);
  end approve_return;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 审批回写：拒绝
  **************************************************/
  procedure rejecte_return(p_head_id       number,
                           p_approved_note varchar2 default null,
                           p_user_id       number) is
  begin
    return_opt(p_head_id    => p_head_id,
               p_opt_status => c_hn_scheme_rejected_status,
               p_user_id    => p_user_id);
  end rejecte_return;
  /*************************************************
  -- author  : zhangxin
  -- created : 2018/8/24 
  -- ver     : 1.1
  -- purpose : 审批回写：处理业务逻辑
  **************************************************/
  procedure return_opt(p_head_id    number,
                       p_opt_status varchar2,
                       p_user_id    number) is
    v_scheme_status_desc varchar2(100);
  begin
    --更新状态
    update hn_source_scheme_head h
       set h.scheme_status    = p_opt_status,
           h.last_update_date = sysdate,
           h.last_updated_by  = p_user_id
     where h.head_id = p_head_id;
    --操作记录 
    select s.code_value_name
      into v_scheme_status_desc
      from sys_code_values_v s
     where s.code = c_hn_scheme_status_syscode
       and s.code_value = p_opt_status
       and s.code_enabled_flag = 'Y'
       and s.code_value_enabled_flag = 'Y';
    operation_record(p_operation_table    => 'hn_source_scheme_head',
                     p_operation_table_id => p_head_id,
                     p_status             => p_opt_status,
                     p_status_desc        => v_scheme_status_desc,
                     p_user_id            => p_user_id);
  end return_opt;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 操作记录
  **************************************************/
  procedure operation_record(p_operation_table    varchar2,
                             p_operation_table_id number,
                             p_status             varchar2,
                             p_status_desc        varchar2,
                             p_user_id            number) is
    t_record_data hn_operation_records%rowtype;
    v_user_name   varchar2(100);
  begin
    select u.description
      into v_user_name
      from sys_user u
     where u.user_id = p_user_id;
    t_record_data.record_id          := lj_operation_records_s.nextval;
    t_record_data.user_id            := p_user_id;
    t_record_data.user_name          := v_user_name;
    t_record_data.status             := p_status;
    t_record_data.status_desc        := p_status_desc;
    t_record_data.operation_desc     := '';
    t_record_data.operation_table    := p_operation_table;
    t_record_data.operation_table_id := p_operation_table_id;
    t_record_data.created_by         := p_user_id;
    t_record_data.creation_date      := sysdate;
    t_record_data.last_updated_by    := p_user_id;
    t_record_data.last_update_date   := sysdate;
    insert into hn_operation_records values t_record_data;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_vendor_source_pkg,
                                                     p_procedure_function_name => 'operation_record');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end operation_record;
end hn_fnd_vendor_source_pkg;
/
