create or replace package jh_con_pkg is

  -- author  : 张大大
  -- created : 2017/12/18 9:57:54
  -- purpose : 合同包

  c_jh_con_pkg       constant varchar2(100) := 'JH_CON_PKG'; --包名
  c_auto_cont_number constant varchar2(100) := 'JH_CON_NUMBER'; --自动生成编号代码
  --合同状态
  c_jh_con_new_status           constant varchar2(100) := 'NEW'; --新建
  c_jh_con_submitted_status     constant varchar2(100) := 'SUBMITTED'; --已提交
  c_jh_con_confirmed_status     constant varchar2(100) := 'CONFIRMED'; --已确认
  c_jh_con_returned_status      constant varchar2(100) := 'RETURNED'; --供应商退回
  c_jh_con_approving_status     constant varchar2(100) := 'APPROVING'; --审批中
  c_jh_con_return_vendor_status constant varchar2(100) := 'RETURN_VENDOR'; --复核退回
  c_jh_con_finished_status      constant varchar2(100) := 'FINISHED'; --已完成
  c_jh_con_rejected_status      constant varchar2(100) := 'REJECTED'; --已拒绝
  c_jh_con_expired_status       constant varchar2(100) := 'EXPIRED'; --已过期
  c_jh_con_canceled_status      constant varchar2(100) := 'CANCELED'; --已取消

  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 创建合同头信息
  **************************************************/
  procedure create_cont_head(o_contract_header_id         out number,
                             o_contract_number            out varchar2,
                             p_document_desc              varchar2 default null,
                             p_contract_type_id           number default null,
                             p_vendor_id                  number default null,
                             p_primary_contract_header_id number default null,
                             p_pur_organization_id        number default null,
                             p_business_unit_id           number default null,
                             p_company_id                 number default null,
                             p_inv_organization_id        number default null,
                             p_pur_buyer_id               number default null,
                             p_status                     varchar2 default c_jh_con_new_status,
                             p_start_date                 date default null,
                             p_end_date                   date default null,
                             p_currency_code              varchar2 default 'CNY',
                             p_contract_place             varchar2 default null,
                             p_framework_contract         varchar2 default null,
                             p_trial_contract_flag        varchar2 default null,
                             p_note                       varchar2 default null,
                             p_version_number             varchar2 default 1,
                             p_version_desc               varchar2 default null,
                             p_transport_mode             varchar2 default null,
                             p_shipping_costs_bear        varchar2 default null,
                             p_settlement_method          varchar2 default null,
                             p_payment_method             varchar2 default null,
                             p_billing_date               date default null,
                             p_invoice_type               varchar2 default null,
                             p_is_manual                  varchar2 default 'Y',
                             p_history_source_flag        varchar2 default 'N',
                             p_cont_nature                varchar2 default null,
                             p_project_code               varchar2 default null,
                             p_project_flag               varchar2 default null,
                             p_pur_type_code              varchar2 default null,
                             p_user_id                    number,
                             p_business_group             varchar2);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 维护合同头信息
  **************************************************/
  procedure update_cont_head(p_contract_header_id         number,
                             p_document_desc              varchar2 default null,
                             p_contract_type_id           number default null,
                             p_vendor_id                  number default null,
                             p_primary_contract_header_id number default null,
                             p_pur_organization_id        number default null,
                             p_business_unit_id           number default null,
                             p_company_id                 number default null,
                             p_inv_organization_id        number default null,
                             p_pur_buyer_id               number default null,
                             p_status                     varchar2 default null,
                             p_start_date                 date default null,
                             p_end_date                   date default null,
                             p_currency_code              varchar2 default null,
                             p_contract_place             varchar2 default null,
                             p_framework_contract         varchar2 default null,
                             p_trial_contract_flag        varchar2 default null,
                             p_note                       varchar2 default null,
                             p_version_number             varchar2 default null,
                             p_version_desc               varchar2 default null,
                             p_transport_mode             varchar2 default null,
                             p_shipping_costs_bear        varchar2 default null,
                             p_settlement_method          varchar2 default null,
                             p_payment_method             varchar2 default null,
                             p_billing_date               date default null,
                             p_invoice_type               varchar2 default null,
                             p_is_manual                  varchar2 default null,
                             p_history_source_flag        varchar2 default 'N',
                             p_cont_nature                varchar2 default null,
                             p_project_code               varchar2 default null,
                             p_project_flag               varchar2 default null,
                             p_pur_type_code              varchar2 default null,
                             p_update_appendix_flag       varchar2 default null,
                             p_user_id                    number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 创建合同标的行信息
  **************************************************/
  procedure create_cont_line(p_contract_header_id    number,
                             p_source_type           varchar2 default null,
                             p_source_line_id        number default null,
                             p_item_id               number default null,
                             p_item_code             varchar2 default null,
                             p_item_desc             varchar2 default null,
                             p_category_id           number default null,
                             p_inv_organization_id   number default null,
                             p_quantity              number default null,
                             p_quantity_uom          number default null,
                             p_uom_code              varchar2 default null,
                             p_tax_rate              number default null,
                             p_tax_type_id           number default null,
                             p_price_tax             number default null,
                             p_deliver_date          date default null,
                             p_quality_acceptance    varchar2 default null,
                             p_sen_acceptance_date   date default null,
                             p_company_order         varchar2 default null,
                             p_company_order_project varchar2 default null,
                             p_manufacturer_desc     varchar2 default null,
                             p_material_grade        varchar2 default null,
                             p_plan_head_id          number default null,
                             p_pur_plan_number       varchar2 default null,
                             p_plan_line_id          number default null,
                             p_plan_line_num         number default null,
                             p_user_id               number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 维护合同标的行信息
  **************************************************/
  procedure update_cont_line(p_contract_line_id      number,
                             p_item_id               number default null,
                             p_item_code             varchar2 default null,
                             p_item_desc             varchar2 default null,
                             p_category_id           number default null,
                             p_inv_organization_id   number default null,
                             p_quantity              number default null,
                             p_quantity_uom          number default null,
                             p_uom_code              varchar2 default null,
                             p_tax_rate              number default null,
                             p_tax_type_id           number default null,
                             p_price_tax             number default null,
                             p_deliver_date          date default null,
                             p_quality_acceptance    varchar2 default null,
                             p_sen_acceptance_date   date default null,
                             p_company_order         varchar2 default null,
                             p_company_order_project varchar2 default null,
                             p_manufacturer_desc     varchar2 default null,
                             p_material_grade        varchar2 default null,
                             p_user_id               number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 创建合同开票方信息
  **************************************************/
  procedure create_cont_bill_vendor(p_contract_header_id number,
                                    p_partner_type       varchar2 default null,
                                    p_partner_id         number default null,
                                    p_partner_name       varchar2 default null,
                                    p_signing_date       date default null,
                                    p_representative     varchar2 default null,
                                    p_telphone           varchar2 default null,
                                    p_fax                varchar2 default null,
                                    p_address            varchar2 default null,
                                    p_bank_name          varchar2 default null,
                                    p_bank_account       varchar2 default null,
                                    p_tax_number         varchar2 default null,
                                    p_post_code          varchar2 default null,
                                    p_email              varchar2 default null,
                                    p_line_num           number default null,
                                    p_user_id            number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 维护合同开票方信息
  **************************************************/
  procedure update_cont_bill_vendor(p_con_partner_id number,
                                    p_partner_type   varchar2 default null,
                                    p_partner_id     number default null,
                                    p_partner_name   varchar2 default null,
                                    p_signing_date   date default null,
                                    p_representative varchar2 default null,
                                    p_telphone       varchar2 default null,
                                    p_fax            varchar2 default null,
                                    p_address        varchar2 default null,
                                    p_bank_name      varchar2 default null,
                                    p_bank_account   varchar2 default null,
                                    p_tax_number     varchar2 default null,
                                    p_post_code      varchar2 default null,
                                    p_email          varchar2 default null,
                                    p_line_num       number default null,
                                    p_user_id        number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 删除合同开票方信息
  **************************************************/
  procedure delete_cont_bill_vendor(p_con_partner_id number,
                                    p_partner_type   varchar2,
                                    p_user_id        number);
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
                             p_user_id            number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 初始化合同条款
  **************************************************/
  procedure create_con_terms_init(p_contract_header_id number,
                                  p_contract_type_id   number,
                                  p_user_id            number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 新增合同条款
  **************************************************/
  procedure create_cont_terms(p_contract_header_id number,
                              p_source_ref_id      number default null,
                              p_current_terms_id   number default null,
                              p_parent_terms_id    number default null,
                              p_con_tplt_id        number default null,
                              p_terms_title        varchar2 default null,
                              p_terms_text         varchar2 default null,
                              p_sequence_num       number default null,
                              p_lock_flag          varchar2 default null,
                              p_user_id            number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 维护合同条款
  **************************************************/
  procedure update_cont_terms(p_terms_id     number,
                              p_sequence_num number default null,
                              p_terms_title  varchar2 default null,
                              p_terms_text   varchar2 default null,
                              p_user_id      number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 删除合同条款
  **************************************************/
  procedure delete_cont_terms(p_terms_id number, p_user_id number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 运费创建
  **************************************************/
  procedure create_con_ship(p_contract_line_id  number,
                            p_line_num          number default null,
                            p_condition_type    varchar2 default null,
                            p_conditional_price number default null,
                            p_bill_company_id   number default null,
                            p_user_id           number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 运费维护
  **************************************************/
  procedure update_con_ship(p_costs_id          number,
                            p_line_num          number default null,
                            p_condition_type    varchar2 default null,
                            p_conditional_price number default null,
                            p_bill_company_id   number default null,
                            p_user_id           number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 创建付款信息
  **************************************************/
  procedure create_con_payment(p_contract_header_id number,
                               p_line_num           number default null,
                               p_payment_type       varchar2 default null,
                               p_payment_date       date default null,
                               p_payment_ratio      number default null,
                               p_user_id            number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 维护付款信息
  **************************************************/
  procedure update_con_payment(p_method_id     number,
                               p_line_num      number default null,
                               p_payment_type  varchar2 default null,
                               p_payment_date  date default null,
                               p_payment_ratio number default null,
                               p_user_id       number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 整单删除
  **************************************************/
  procedure delete_con_for_all(p_contract_header_id number,
                               p_user_id            number);

  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 提交合同
  **************************************************/
  procedure submit_con(p_contract_header_id number, p_user_id number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 取消合同操作
  **************************************************/
  procedure cancel_con(p_contract_header_id number,
                       p_status             varchar2,
                       p_user_id            number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 供应商合同操作
  **************************************************/
  procedure vendor_con_opt(p_contract_header_id number,
                           p_status             varchar2,
                           p_vendor_note        varchar2,
                           p_user_id            number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 审批合同操作
  **************************************************/
  procedure approve_con_opt(p_contract_header_id number,
                            p_status             varchar2,
                            p_vendor_note        varchar2 default null,
                            p_user_id            number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 附件创建
  **************************************************/
  procedure create_con_attm(p_contract_header_id number,
                            p_line_num           number default null,
                            p_file_name          varchar2 default null,
                            p_upload_party       number default null,
                            p_upload_date        date default null,
                            p_comments           varchar2 default null,
                            p_user_id            number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 附件维护
  **************************************************/
  procedure update_con_attm(p_con_attchment_id number,
                            p_line_num         number default null,
                            p_file_name        varchar2 default null,
                            p_upload_party     number default null,
                            p_upload_date      date default null,
                            p_comments         varchar2 default null,
                            p_user_id          number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 附件删除
  **************************************************/
  procedure delete_con_attm(p_con_attchment_id number, p_user_id number);

  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 释放寻源行数据和采购计划行数量：整单删除和取消合同会用到
  **************************************************/
  procedure release_source_plan(p_contract_line_id number,
                                p_user_id          number);

  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 系统请求：将已过期的合同进行过期处理
  **************************************************/
  procedure auto_expired(p_request_id number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : OA审批回写:p_document_opt：
               Y表示审批通过，N表示审批拒绝
  **************************************************/
  procedure oa_return(p_document_number varchar2,
                      p_document_result varchar2,
                      p_attribute1      varchar2 default null,
                      p_attribute2      varchar2 default null,
                      p_attribute3      varchar2 default null,
                      p_attribute4      varchar2 default null,
                      p_attribute5      varchar2 default null,
                      p_attribute6      varchar2 default null,
                      p_attribute7      varchar2 default null,
                      p_attribute8      varchar2 default null,
                      p_attribute9      varchar2 default null,
                      p_attribute10     varchar2 default null,
                      p_user_id         NUMBER);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 自定义合同编号
  **************************************************/
  function get_cont_number(p_contract_type_id number, p_user_id number)
    return varchar2;

  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 合同外部供应商定义
  **************************************************/
  procedure cont_external_vendor_insert(p_vendor_id      number,
                                        p_vendor_code    varchar2,
                                        p_vendor_desc    varchar2,
                                        p_business_group varchar2,
                                        p_attribute1     varchar2 default null,
                                        p_attribute2     varchar2 default null,
                                        p_attribute3     varchar2 default null,
                                        p_attribute4     varchar2 default null,
                                        p_attribute5     varchar2 default null,
                                        p_attribute6     varchar2 default null,
                                        p_attribute7     varchar2 default null,
                                        p_attribute8     varchar2 default null,
                                        p_attribute9     varchar2 default null,
                                        p_attribute10    varchar2 default null,
                                        p_user_id        number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 合同模板鎖定
  **************************************************/
  procedure con_tplt_lock_opt(p_con_item_id number,
                              p_opt_code    varchar2,
                              p_user_id     number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 合同模板复制
  **************************************************/
  procedure con_tplt_copy_opt(p_tplt_id NUMBER, p_user_id NUMBER);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 合同提交通知供应商
  **************************************************/
  procedure get_con_vendor(p_message_id        NUMBER,
                           p_event_param       NUMBER,
                           p_recipient_id      NUMBER,
                           p_recipient_type_id NUMBER,
                           p_user_id           NUMBER);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 获取合同创建人
  **************************************************/
  procedure get_con_create_by(p_message_id        NUMBER,
                              p_event_param       NUMBER,
                              p_recipient_id      NUMBER,
                              p_recipient_type_id NUMBER,
                              p_user_id           NUMBER);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 删除附录
  **************************************************/
  procedure delete_cont_appendix(p_appendix_id number, p_user_id number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 新增附录：自动按照回车键分行
  **************************************************/
  procedure create_cont_appendix(p_contract_header_id number,
                                 p_line_num           number,
                                 p_appendix_title     varchar2,
                                 p_appendix_text      clob,
                                 p_user_id            number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 初始化新增附录：按行进行新增
  **************************************************/
  procedure create_cont_appendix_init(p_contract_header_id number,
                                      p_line_num           number,
                                      p_appendix_title     varchar2,
                                      p_appendix_text      varchar2,
                                      p_user_id            number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 更新附录
  **************************************************/
  procedure update_cont_appendix(p_contract_header_id number,
                                 p_line_num           number,
                                 p_appendix_title     varchar2,
                                 p_appendix_text      clob,
                                 p_user_id            number);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 整单创建合同
  **************************************************/
  procedure create_cont_for_all_line(o_con_head_id_list     out varchar2,
                                     o_contract_number_list out varchar2,
                                     p_source_type          varchar2,
                                     p_source_number        varchar2,
                                     p_user_id              number,
                                     p_business_group       varchar2);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 整单创建合同：招投标
  **************************************************/
  procedure create_cont_for_all_bid(o_con_head_id_list     out varchar2,
                                    o_contract_number_list out varchar2,
                                    p_source_number        varchar2,
                                    p_user_id              number,
                                    p_business_group       varchar2);
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 整单创建合同：询报价
  **************************************************/
  procedure create_cont_for_all_rfx(o_con_head_id_list     out varchar2,
                                    o_contract_number_list out varchar2,
                                    p_source_number        varchar2,
                                    p_user_id              number,
                                    p_business_group       varchar2);
end jh_con_pkg;
/
create or replace package body jh_con_pkg is

  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 创建合同头信息
  **************************************************/
  procedure create_cont_head(o_contract_header_id         out number,
                             o_contract_number            out varchar2,
                             p_document_desc              varchar2 default null,
                             p_contract_type_id           number default null,
                             p_vendor_id                  number default null,
                             p_primary_contract_header_id number default null,
                             p_pur_organization_id        number default null,
                             p_business_unit_id           number default null,
                             p_company_id                 number default null,
                             p_inv_organization_id        number default null,
                             p_pur_buyer_id               number default null,
                             p_status                     varchar2 default c_jh_con_new_status,
                             p_start_date                 date default null,
                             p_end_date                   date default null,
                             p_currency_code              varchar2 default 'CNY',
                             p_contract_place             varchar2 default null,
                             p_framework_contract         varchar2 default null,
                             p_trial_contract_flag        varchar2 default null,
                             p_note                       varchar2 default null,
                             p_version_number             varchar2 default 1,
                             p_version_desc               varchar2 default null,
                             p_transport_mode             varchar2 default null,
                             p_shipping_costs_bear        varchar2 default null,
                             p_settlement_method          varchar2 default null,
                             p_payment_method             varchar2 default null,
                             p_billing_date               date default null,
                             p_invoice_type               varchar2 default null,
                             p_is_manual                  varchar2 default 'Y',
                             p_history_source_flag        varchar2 default 'N',
                             p_cont_nature                varchar2 default null,
                             p_project_code               varchar2 default null,
                             p_project_flag               varchar2 default null,
                             p_pur_type_code              varchar2 default null,
                             p_user_id                    number,
                             p_business_group             varchar2) is
    t_head_data    con_contract_headers_new%rowtype;
    t_partner_data con_contract_partners_new%rowtype;
    v_pur_buyer_id number;
    e_error exception;
    v_message            varchar2(1000);
    v_cont_nature        varchar2(100);
    v_start_date         date;
    v_end_date           date;
    v_primary_start_date date;
    v_primary_end_date   date;
    v_type_code          varchar2(100);
    v_legal_affairs_flag varchar2(100);
    v_count              number;
  begin
    --如果创建的时候日期为空，则默认值
    if p_start_date is null then
      v_start_date := sysdate;
    else
      v_start_date := p_start_date;
    end if;
    if p_end_date is null then
      v_end_date := add_months(sysdate, 12);
    else
      v_end_date := p_end_date;
    end if;
    if p_pur_buyer_id is null then
      --取账号绑定的采购员
      begin
        select pb.buyer_id
          into v_pur_buyer_id
          from pur_buyers_vl pb
         where pb.user_id = p_user_id
           and pb.enabled_flag = 'Y'
           and pb.business_group = p_business_group;
      exception
        when no_data_found then
          --取默认F01采购员
          select pb.buyer_id
            into v_pur_buyer_id
            from pur_buyers_vl pb
           where pb.display_code = 'F01'
             and pb.enabled_flag = 'Y'
             and pb.business_group = p_business_group;
          --v_message := '当前账号未绑定采购员！无法创建合同！';
        --raise e_error;
      end;
    else
      v_pur_buyer_id := p_pur_buyer_id;
    end if;
    --只有手工创建合同时才不会空，所以这段逻辑只是针对手工创建合同
    if p_contract_type_id is not null then
      select t.type_code
        into v_type_code
        from pur_con_types t
       where t.con_type_id = p_contract_type_id;
      --如果有主合同编号，则将主合同编号的有效期至和当前选用的有效期做对比，谁小取谁
      if p_primary_contract_header_id is not null and v_type_code = 'PE' then
        select ch.start_date, ch.end_date
          into v_primary_start_date, v_primary_end_date
          from con_contract_headers_new ch
         where ch.contract_header_id = p_primary_contract_header_id;
        if v_end_date is not null then
          if v_primary_end_date > v_end_date then
            v_primary_end_date := v_end_date;
          end if;
        end if;
        if v_start_date is not null then
          if v_primary_start_date > v_start_date then
            v_primary_start_date := v_start_date;
          end if;
        end if;
      else
        v_primary_start_date := v_start_date;
        v_primary_end_date   := v_end_date;
      end if;
    end if;
    --合同性质
    v_cont_nature := p_cont_nature;
    select count(1)
      into v_count
      from jh_cont_external_vendor c
     where c.vendor_id = p_vendor_id;
    if p_cont_nature is null then
      --重新获取供应商是否是E标记
      --重新获取供应商是否是E标记
      if v_count = 0 then
        v_cont_nature := 'I';
      else
        v_cont_nature := 'E';
      end if;
    end if;
    --法务审批：合同性质是外部合同并且在 jh_cont_external_vendor 里不存在则设置法务审批
    if v_count = 0 and v_cont_nature = 'E' then
      v_legal_affairs_flag := 'Y';
    else
      v_legal_affairs_flag := 'N';
    end if;
    --合同号
    if p_contract_type_id is not null then
      --根据合同类型生成编号
      t_head_data.contract_number := get_cont_number(p_contract_type_id => p_contract_type_id,
                                                     p_user_id          => p_user_id);
    else
      --生成临时编号
      t_head_data.contract_number := fnd_code_rule_pkg.get_rule_next_auto_num(c_auto_cont_number,
                                                                              NULL,
                                                                              NULL,
                                                                              p_user_id);
    end if;
  
    t_head_data.contract_header_id         := con_contract_headers_new_s.nextval;
    t_head_data.document_desc              := p_document_desc;
    t_head_data.contract_type_id           := p_contract_type_id;
    t_head_data.vendor_id                  := p_vendor_id;
    t_head_data.primary_contract_header_id := p_primary_contract_header_id;
    t_head_data.pur_organization_id        := p_pur_organization_id;
    t_head_data.business_unit_id           := p_business_unit_id;
    t_head_data.company_id                 := p_company_id;
    t_head_data.inv_organization_id        := p_inv_organization_id;
    t_head_data.pur_buyer_id               := v_pur_buyer_id;
    t_head_data.status                     := p_status;
    t_head_data.start_date                 := v_primary_start_date;
    t_head_data.end_date                   := v_primary_end_date;
    t_head_data.currency_code              := nvl(p_currency_code, 'CNY');
    t_head_data.contract_place             := p_contract_place;
    t_head_data.framework_contract         := p_framework_contract;
    t_head_data.trial_contract_flag        := p_trial_contract_flag;
    t_head_data.note                       := p_note;
    t_head_data.version_number             := p_version_number;
    t_head_data.version_desc               := p_version_desc;
    t_head_data.transport_mode             := p_transport_mode;
    t_head_data.shipping_costs_bear        := p_shipping_costs_bear;
    t_head_data.settlement_method          := p_settlement_method;
    t_head_data.payment_method             := p_payment_method;
    t_head_data.billing_date               := p_billing_date;
    t_head_data.invoice_type               := p_invoice_type;
    t_head_data.is_manual                  := nvl(p_is_manual, 'Y');
    t_head_data.history_source_flag        := p_history_source_flag;
    t_head_data.cont_nature                := v_cont_nature;
    t_head_data.project_code               := p_project_code;
    t_head_data.project_flag               := p_project_flag;
    t_head_data.pur_type_code              := p_pur_type_code;
    t_head_data.business_group             := p_business_group;
    t_head_data.legal_affairs_flag         := v_legal_affairs_flag;
    t_head_data.document_date              := sysdate;
    t_head_data.created_by                 := p_user_id;
    t_head_data.creation_date              := SYSDATE;
    t_head_data.last_updated_by            := p_user_id;
    t_head_data.last_update_date           := SYSDATE;
    insert into con_contract_headers_new values t_head_data;
    --回写
    o_contract_header_id := t_head_data.contract_header_id;
    o_contract_number    := t_head_data.contract_number;
    --操作记录
    operation_record(p_operation_table    => 'con_contract_headers_new',
                     p_operation_table_id => t_head_data.contract_header_id,
                     p_status             => c_jh_con_new_status,
                     p_status_desc        => '新建',
                     p_user_id            => p_user_id);
    --开票方信息
    select v.company_full_name,
           c.contact_name,
           c.mobile_phone,
           c.email,
           v.address,
           v.fax_no,
           v.post_code,
           NVL(v.tax_id_number,
               NVL(v.business_license_number, NVL(v.unified_social_code, ''))) tax_number,
           a.bank_branch_name,
           a.bank_account_number
      into t_partner_data.partner_name,
           t_partner_data.representative,
           t_partner_data.telphone,
           t_partner_data.email,
           t_partner_data.address,
           t_partner_data.fax,
           t_partner_data.post_code,
           t_partner_data.tax_number,
           t_partner_data.bank_name,
           t_partner_data.bank_account
      from fnd_companies_vl     v,
           fnd_com_sup_contacts c,
           fnd_com_sup_accounts a
     where v.company_id = p_vendor_id
       and c.company_id(+) = v.company_id
       and c.enabled_flag(+) = 'Y'
       and c.default_contact_flag(+) = 'Y'
       and a.company_id(+) = v.company_id
       and a.enabled_flag(+) = 'Y'
       and a.primary_account_flag(+) = 'Y'
       AND rownum = 1;
    create_cont_bill_vendor(p_contract_header_id => t_head_data.contract_header_id,
                            p_partner_type       => 'VENDOR',
                            p_partner_id         => p_vendor_id,
                            p_partner_name       => t_partner_data.partner_name,
                            p_representative     => t_partner_data.representative,
                            p_telphone           => t_partner_data.telphone,
                            p_fax                => t_partner_data.fax,
                            p_address            => t_partner_data.address,
                            p_bank_name          => t_partner_data.bank_name,
                            p_bank_account       => t_partner_data.bank_account,
                            p_tax_number         => t_partner_data.tax_number,
                            p_post_code          => t_partner_data.post_code,
                            p_email              => t_partner_data.email,
                            p_line_num           => 1,
                            p_user_id            => p_user_id);
    if v_cont_nature = 'I' then
      --创建合同条款信息
      create_con_terms_init(p_contract_header_id => t_head_data.contract_header_id,
                            p_contract_type_id   => p_contract_type_id,
                            p_user_id            => p_user_id);
    end if;
    --20180428:自动生成一条附录信息
    for t_fl_data in (select l.item_title, l.item_text
                        from pur_con_tplt_hds h, pur_con_tplt_lns l
                       where h.con_tplt_code = 'FL'
                         and h.con_tplt_id = l.con_tplt_id
                         and l.enabled_flag = 'Y'
                         and h.enabled_flag = 'Y'
                       ORDER BY l.sequence) loop
      create_cont_appendix_init(p_contract_header_id => t_head_data.contract_header_id,
                                p_line_num           => 1,
                                p_appendix_title     => '附录1',
                                p_appendix_text      => t_fl_data.item_title ||
                                                        t_fl_data.item_text,
                                p_user_id            => p_user_id);
    end loop;
  exception
    when e_error then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => v_message,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'create_cont_head');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '创建合同失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'create_cont_head');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end create_cont_head;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 维护合同头信息
  **************************************************/
  procedure update_cont_head(p_contract_header_id         number,
                             p_document_desc              varchar2 default null,
                             p_contract_type_id           number default null,
                             p_vendor_id                  number default null,
                             p_primary_contract_header_id number default null,
                             p_pur_organization_id        number default null,
                             p_business_unit_id           number default null,
                             p_company_id                 number default null,
                             p_inv_organization_id        number default null,
                             p_pur_buyer_id               number default null,
                             p_status                     varchar2 default null,
                             p_start_date                 date default null,
                             p_end_date                   date default null,
                             p_currency_code              varchar2 default null,
                             p_contract_place             varchar2 default null,
                             p_framework_contract         varchar2 default null,
                             p_trial_contract_flag        varchar2 default null,
                             p_note                       varchar2 default null,
                             p_version_number             varchar2 default null,
                             p_version_desc               varchar2 default null,
                             p_transport_mode             varchar2 default null,
                             p_shipping_costs_bear        varchar2 default null,
                             p_settlement_method          varchar2 default null,
                             p_payment_method             varchar2 default null,
                             p_billing_date               date default null,
                             p_invoice_type               varchar2 default null,
                             p_is_manual                  varchar2 default null,
                             p_history_source_flag        varchar2 default 'N',
                             p_cont_nature                varchar2 default null,
                             p_project_code               varchar2 default null,
                             p_project_flag               varchar2 default null,
                             p_pur_type_code              varchar2 default null,
                             p_update_appendix_flag       varchar2 default null,
                             p_user_id                    number) is
    v_count  number;
    v_status varchar2(100);
    e_error exception;
    v_message            varchar2(2000);
    v_contract_number    varchar2(100);
    v_type_code          varchar2(100);
    v_start_date         date;
    v_end_date           date;
    v_legal_affairs_flag varchar2(100);
  begin
    --锁定单据，并且校验单据状态是否处在可维护状态
    select h.status, h.contract_number
      into v_status, v_contract_number
      from con_contract_headers_new h
     where h.contract_header_id = p_contract_header_id;
    if v_status not in (c_jh_con_new_status,
                        c_jh_con_returned_status,
                        c_jh_con_rejected_status) then
      v_message := '单据状态发生变更，无法进行维护';
      raise e_error;
    end if;
    /*校验：若行上存在采购计划，则头上的合同类型不能选择：框架协议、简易采购合同
    这里只需要考虑正常寻源创建的合同，手工创建和历史寻源创建的都是无采购计划的,且
    正常寻源创建的合同行上的采购计划是不可维护的，所以在维护头数据的时候校验即可
    另外：is_manual='N'虽然是合同创建的标记，但是也可以没有采购计划，因为寻源可能
    是手工创建的，所以必须去校验行上的字段*/
    select count(1)
      into v_count
      from con_contract_lines_new l
     where l.contract_header_id = p_contract_header_id
       and l.plan_head_id is not null;
    select t.type_code
      into v_type_code
      from pur_con_types t
     where t.con_type_id = p_contract_type_id;
    if v_count <> 0 and v_type_code in ('PE', 'PF') then
      v_message := '当前合同行上存在<采购计划>信息，不允许选择<采购框架协议>和<简易采购合同>！';
      raise e_error;
    end if;
    --校验：寻源创建的合同不允许选择pp合同
    if nvl(p_is_manual, 'N') = 'N' and v_type_code = 'PP' then
      v_message := '非手工创建的合同，合同类型不允许选择<项目合同>';
      raise e_error;
    end if;
    --简易合同如果有主合同编号，则将主合同编号的有效期至和当前选用的有效期做对比，谁小取谁
    if p_primary_contract_header_id is not null and v_type_code = 'PE' then
      select ch.start_date, ch.end_date
        into v_start_date, v_end_date
        from con_contract_headers_new ch
       where ch.contract_header_id = p_primary_contract_header_id;
      if p_end_date is not null then
        if v_end_date > p_end_date then
          v_end_date := p_end_date;
        end if;
      end if;
      if p_start_date is not null then
        if v_start_date > p_start_date then
          v_start_date := p_start_date;
        end if;
      end if;
    else
      v_start_date := p_start_date;
      v_end_date   := p_end_date;
    end if;
    --法务审批：合同性质是外部合同并且在 jh_cont_external_vendor 里不存在则设置法务审批
    select count(1)
      into v_count
      from jh_cont_external_vendor c
     where c.vendor_id = p_vendor_id;
    if v_count = 0 and p_cont_nature = 'E' then
      v_legal_affairs_flag := 'Y';
    else
      v_legal_affairs_flag := 'N';
    end if;
    --如果确认修改附录一，则直接设置法务审批，优先级最高
    if p_update_appendix_flag = 'Y' then
      v_legal_affairs_flag := 'Y';
    end if;
    --生成合同编号
    if v_contract_number is null or v_contract_number like 'LS%' then
      v_contract_number := get_cont_number(p_contract_type_id => p_contract_type_id,
                                           p_user_id          => p_user_id);
    end if;
    update con_contract_headers_new h
       set h.contract_number            = v_contract_number,
           h.document_desc              = p_document_desc,
           h.contract_type_id           = p_contract_type_id,
           h.vendor_id                  = p_vendor_id,
           h.primary_contract_header_id = p_primary_contract_header_id,
           h.pur_organization_id        = p_pur_organization_id,
           h.business_unit_id           = p_business_unit_id,
           h.company_id                 = p_company_id,
           h.inv_organization_id        = p_inv_organization_id,
           h.pur_buyer_id               = p_pur_buyer_id,
           h.status                     = p_status,
           h.start_date                 = v_start_date,
           h.end_date                   = v_end_date,
           h.currency_code              = p_currency_code,
           h.contract_place             = p_contract_place,
           h.framework_contract         = p_framework_contract,
           h.trial_contract_flag        = p_trial_contract_flag,
           h.update_appendix_flag       = p_update_appendix_flag,
           h.note                       = p_note,
           h.version_number             = p_version_number,
           h.version_desc               = p_version_desc,
           h.transport_mode             = p_transport_mode,
           h.shipping_costs_bear        = p_shipping_costs_bear,
           h.settlement_method          = p_settlement_method,
           h.payment_method             = p_payment_method,
           h.billing_date               = p_billing_date,
           h.invoice_type               = p_invoice_type,
           h.is_manual                  = p_is_manual,
           h.history_source_flag        = p_history_source_flag,
           h.legal_affairs_flag         = v_legal_affairs_flag,
           h.cont_nature                = p_cont_nature,
           h.project_code               = p_project_code,
           h.project_flag               = p_project_flag,
           h.pur_type_code              = p_pur_type_code,
           h.last_updated_by            = p_user_id,
           h.last_update_date           = sysdate
     where h.contract_header_id = p_contract_header_id;
    /*由于手工创建的合同会初始会选择合同类型，所以生产合同头的时候就会生成条款信息，而
    寻源创建的合同，初始不会有合同类型，所以不会生成条款信息，因此在保存时，重新生成条款*/
    select count(1)
      into v_count
      from con_contract_terms_new c
     where c.contract_header_id = p_contract_header_id;
    if v_count = 0 and p_cont_nature = 'I' then
      --如果当前合同还没有条款信息则需要创建合同条款信息
      create_con_terms_init(p_contract_header_id => p_contract_header_id,
                            p_contract_type_id   => p_contract_type_id,
                            p_user_id            => p_user_id);
    end if;
  exception
    WHEN e_error THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => v_message,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'update_cont_head');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '维护合同失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'update_cont_head');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end update_cont_head;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 创建合同标的行信息
  **************************************************/
  procedure create_cont_line(p_contract_header_id    number,
                             p_source_type           varchar2 default null,
                             p_source_line_id        number default null,
                             p_item_id               number default null,
                             p_item_code             varchar2 default null,
                             p_item_desc             varchar2 default null,
                             p_category_id           number default null,
                             p_inv_organization_id   number default null,
                             p_quantity              number default null,
                             p_quantity_uom          number default null,
                             p_uom_code              varchar2 default null,
                             p_tax_rate              number default null,
                             p_tax_type_id           number default null,
                             p_price_tax             number default null,
                             p_deliver_date          date default null,
                             p_quality_acceptance    varchar2 default null,
                             p_sen_acceptance_date   date default null,
                             p_company_order         varchar2 default null,
                             p_company_order_project varchar2 default null,
                             p_manufacturer_desc     varchar2 default null,
                             p_material_grade        varchar2 default null,
                             p_plan_head_id          number default null,
                             p_pur_plan_number       varchar2 default null,
                             p_plan_line_id          number default null,
                             p_plan_line_num         number default null,
                             p_user_id               number) is
    v_fixed_asset_code    varchar2(100);
    v_max_line_num        number;
    t_line_data           con_contract_lines_new%rowtype;
    v_status              varchar2(100);
    v_source_number       varchar2(100);
    v_message             varchar2(1000);
    v_history_source_flag varchar2(100);
    e_error exception;
  begin
    --查询头对于的历史寻源标记
    select nvl(h.history_source_flag, 'N')
      into v_history_source_flag
      from con_contract_headers_new h
     where h.contract_header_id = p_contract_header_id;
    --如果是通过寻源结果创建的合同，则回写已创建合同数量到对应的采购计划上
    if p_plan_line_id is not null and v_history_source_flag = 'N' then
      update jh_pur_plan_line l
         set l.contract_quantity = nvl(l.contract_quantity, 0) + p_quantity,
             l.last_update_date  = sysdate,
             l.last_updated_by   = p_user_id
       where l.line_id = p_plan_line_id;
      --查询固定资产号
      select l.fixed_asset_code
        into v_fixed_asset_code
        from jh_pur_plan_line l
       where l.line_id = p_plan_line_id;
    end if;
    --将对应的寻源行打上已创建合同标记
    if p_source_type is not null then
      --先校验对应寻源单据状态是否发生变更
      if p_source_type like '%BID' then
        select h.status, h.entrustment_header_number
          into v_status, v_source_number
          from bid_entrustment_headers  h,
               bid_entrustment_ln_items l,
               bid_bidding_docm_lines   dl
         where h.entrustment_header_id = l.entrustment_header_id
           and dl.entrustment_line_item_id = l.line_item_id
           and dl.bid_line_id = p_source_line_id;
        if v_status <> 'FINISHED' then
          v_message := '招标单据：' + v_source_number + ' 状态已发生改变，无法创建合同，请检查';
          raise e_error;
        end if;
        if v_history_source_flag = 'N' then
          update bid_bidding_docm_lines l
             set l.create_con_flag  = 'Y',
                 l.last_update_date = sysdate,
                 l.last_updated_by  = p_user_id
           where l.bid_line_id = p_source_line_id;
        end if;
      else
        select h.status, h.rfx_number
          into v_status, v_source_number
          from pur_rfx_headers        h,
               pur_rfx_ln_items       l,
               pur_rfx_feedback_lines fl
         where h.rfx_header_id = l.rfx_header_id
           and fl.rfx_line_item_id = l.rfx_line_item_id
           and fl.feedback_line_id = p_source_line_id;
        if v_status <> 'FINISHED' then
          v_message := '询价单据单据：' + v_source_number + ' 状态已发生改变，无法创建合同，请检查';
          raise e_error;
        end if;
        if v_history_source_flag = 'N' then
          update pur_rfx_feedback_lines l
             set l.create_con_flag  = 'Y',
                 l.last_update_date = sysdate,
                 l.last_updated_by  = p_user_id
           where l.feedback_line_id = p_source_line_id;
        end if;
      end if;
    end if;
    --合同标的信息
    --行号
    select nvl(max(nvl(to_number(l.line_num), 0)), 0)
      into v_max_line_num
      from con_contract_lines_new l
     where l.contract_header_id = p_contract_header_id;
    /*如果是历史寻源合同则置空计划信息
    手工创建过来的，计划信息本身就是空，寻源创建合同的计划信息有值，
    而历史寻源合同数据来源是寻源信息，期初时是有值的，所以这里必须
    把历史寻源创建合同的计划信息置空*/
    if v_history_source_flag = 'Y' then
      t_line_data.plan_head_id    := '';
      t_line_data.pur_plan_number := '';
      t_line_data.plan_line_id    := '';
      t_line_data.plan_line_num   := '';
    else
      t_line_data.plan_head_id    := p_plan_head_id;
      t_line_data.pur_plan_number := p_pur_plan_number;
      t_line_data.plan_line_id    := p_plan_line_id;
      t_line_data.plan_line_num   := p_plan_line_num;
    end if;
    t_line_data.contract_line_id      := con_contract_lines_new_s.nextval;
    t_line_data.contract_header_id    := p_contract_header_id;
    t_line_data.line_num              := v_max_line_num + 1;
    t_line_data.item_id               := p_item_id;
    t_line_data.item_code             := p_item_code;
    t_line_data.item_desc             := p_item_desc;
    t_line_data.category_id           := p_category_id;
    t_line_data.inv_organization_id   := p_inv_organization_id;
    t_line_data.quantity              := p_quantity;
    t_line_data.quantity_init         := p_quantity;
    t_line_data.order_quantity        := 0;
    t_line_data.last_order_quantity   := p_quantity;
    t_line_data.quantity_uom          := nvl(p_quantity_uom, 1);
    t_line_data.unit_meas_lookup_code := p_uom_code;
    t_line_data.tax_rate              := p_tax_rate;
    t_line_data.tax_type_id           := p_tax_type_id;
    t_line_data.price_tax             := p_price_tax;
    t_line_data.price_tax_init        := p_price_tax;
    t_line_data.amount_tax            := round(p_price_tax * p_quantity, 2);
    t_line_data.deliver_date          := p_deliver_date;
    t_line_data.company_order         := p_company_order;
    t_line_data.company_order_project := p_company_order_project;
    t_line_data.manufacturer_desc     := p_manufacturer_desc;
    t_line_data.material_grade        := p_material_grade;
    t_line_data.quality_acceptance    := p_quality_acceptance;
    t_line_data.sen_acceptance_date   := p_sen_acceptance_date;
    t_line_data.source_ref_id         := p_source_line_id;
    t_line_data.source_ref_type       := p_source_type;
    t_line_data.created_by            := p_user_id;
    t_line_data.creation_date         := sysdate;
    t_line_data.last_updated_by       := p_user_id;
    t_line_data.last_update_date      := sysdate;
    insert into con_contract_lines_new values t_line_data;
  exception
    when e_error then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => v_message,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'create_cont_line');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '创建合同标的信息失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'create_cont_line');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end create_cont_line;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 维护合同标的行信息
  **************************************************/
  procedure update_cont_line(p_contract_line_id      number,
                             p_item_id               number default null,
                             p_item_code             varchar2 default null,
                             p_item_desc             varchar2 default null,
                             p_category_id           number default null,
                             p_inv_organization_id   number default null,
                             p_quantity              number default null,
                             p_quantity_uom          number default null,
                             p_uom_code              varchar2 default null,
                             p_tax_rate              number default null,
                             p_tax_type_id           number default null,
                             p_price_tax             number default null,
                             p_deliver_date          date default null,
                             p_quality_acceptance    varchar2 default null,
                             p_sen_acceptance_date   date default null,
                             p_company_order         varchar2 default null,
                             p_company_order_project varchar2 default null,
                             p_manufacturer_desc     varchar2 default null,
                             p_material_grade        varchar2 default null,
                             p_user_id               number) is
  begin
    update con_contract_lines_new t
       set t.item_id               = p_item_id,
           t.item_code             = p_item_code,
           t.item_desc             = p_item_desc,
           t.category_id           = p_category_id,
           t.inv_organization_id   = p_inv_organization_id,
           t.quantity              = p_quantity,
           t.order_quantity        = 0,
           t.last_order_quantity   = p_quantity,
           t.quantity_uom          = p_quantity_uom,
           t.unit_meas_lookup_code = p_uom_code,
           t.tax_rate              = p_tax_rate,
           t.tax_type_id           = p_tax_type_id,
           t.price_tax             = p_price_tax,
           t.amount_tax            = round(p_price_tax * p_quantity, 2),
           t.deliver_date          = p_deliver_date,
           t.quality_acceptance    = p_quality_acceptance,
           t.sen_acceptance_date   = p_sen_acceptance_date,
           t.company_order         = p_company_order,
           t.company_order_project = p_company_order_project,
           t.manufacturer_desc     = p_manufacturer_desc,
           t.material_grade        = p_material_grade,
           t.last_updated_by       = p_user_id,
           t.last_update_date      = sysdate
     where t.contract_line_id = p_contract_line_id;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '维护合同标的信息失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'update_cont_line');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end update_cont_line;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 创建合同开票方信息
  **************************************************/
  procedure create_cont_bill_vendor(p_contract_header_id number,
                                    p_partner_type       varchar2 default null,
                                    p_partner_id         number default null,
                                    p_partner_name       varchar2 default null,
                                    p_signing_date       date default null,
                                    p_representative     varchar2 default null,
                                    p_telphone           varchar2 default null,
                                    p_fax                varchar2 default null,
                                    p_address            varchar2 default null,
                                    p_bank_name          varchar2 default null,
                                    p_bank_account       varchar2 default null,
                                    p_tax_number         varchar2 default null,
                                    p_post_code          varchar2 default null,
                                    p_email              varchar2 default null,
                                    p_line_num           number default null,
                                    p_user_id            number) is
    t_partner_data con_contract_partners_new%rowtype;
  begin
    --生成第一行供应商信息
    t_partner_data.con_partner_id     := con_contract_partners_new_s.nextval;
    t_partner_data.contract_header_id := p_contract_header_id;
    t_partner_data.partner_type       := p_partner_type;
    t_partner_data.partner_id         := p_partner_id;
    t_partner_data.signing_date       := p_signing_date;
    t_partner_data.partner_name       := p_partner_name;
    t_partner_data.representative     := p_representative;
    t_partner_data.telphone           := p_telphone;
    t_partner_data.address            := p_address;
    t_partner_data.fax                := p_fax;
    t_partner_data.post_code          := p_post_code;
    t_partner_data.tax_number         := p_tax_number;
    t_partner_data.bank_name          := p_bank_name;
    t_partner_data.bank_account       := p_bank_account;
    t_partner_data.email              := p_email;
    t_partner_data.line_num           := p_line_num;
    t_partner_data.created_by         := p_user_id;
    t_partner_data.creation_date      := sysdate;
    t_partner_data.last_updated_by    := p_user_id;
    t_partner_data.last_update_date   := sysdate;
    insert into con_contract_partners_new values t_partner_data;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '维护合同开票方信息失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'create_cont_bill_vendor');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end create_cont_bill_vendor;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 创建合同开票方信息
  **************************************************/
  procedure update_cont_bill_vendor(p_con_partner_id number,
                                    p_partner_type   varchar2 default null,
                                    p_partner_id     number default null,
                                    p_partner_name   varchar2 default null,
                                    p_signing_date   date default null,
                                    p_representative varchar2 default null,
                                    p_telphone       varchar2 default null,
                                    p_fax            varchar2 default null,
                                    p_address        varchar2 default null,
                                    p_bank_name      varchar2 default null,
                                    p_bank_account   varchar2 default null,
                                    p_tax_number     varchar2 default null,
                                    p_post_code      varchar2 default null,
                                    p_email          varchar2 default null,
                                    p_line_num       number default null,
                                    p_user_id        number) is
  begin
    update con_contract_partners_new p
       set p.partner_type     = p_partner_type,
           p.partner_id       = p_partner_id,
           p.partner_name     = p_partner_name,
           p.signing_date     = p_signing_date,
           p.representative   = p_representative,
           p.telphone         = p_telphone,
           p.fax              = p_fax,
           p.address          = p_address,
           p.bank_name        = p_bank_name,
           p.email            = p_email,
           p.bank_account     = p_bank_account,
           p.tax_number       = p_tax_number,
           p.post_code        = p_post_code,
           p.line_num         = p_line_num,
           p.last_updated_by  = p_user_id,
           p.last_update_date = sysdate
     where p.con_partner_id = p_con_partner_id;
  
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '创建合同开票方信息失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'update_cont_bill_vendor');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end update_cont_bill_vendor;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 删除合同开票方信息
  **************************************************/
  procedure delete_cont_bill_vendor(p_con_partner_id number,
                                    p_partner_type   varchar2,
                                    p_user_id        number) is
    e_partner_type_error exception;
  begin
    if p_partner_type = 'VENDOR' then
      raise e_partner_type_error;
    end if;
    delete from con_contract_partners_new c
     where c.con_partner_id = p_con_partner_id;
  exception
    when e_partner_type_error then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '不允许删除<供应商>开票信息!',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'delete_cont_bill_vendor');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '删除合同开票方信息失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'delete_cont_bill_vendor');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end delete_cont_bill_vendor;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 操作记录
  **************************************************/
  procedure operation_record(p_operation_table    in varchar2,
                             p_operation_table_id in number,
                             p_status             in varchar2,
                             p_status_desc        in varchar2,
                             p_user_id            in number) is
    t_record_data pur_req_operation_records%rowtype;
  begin
    select su.user_id, su.description
      into t_record_data.user_id, t_record_data.user_name
      from sys_user su
     where su.user_id = p_user_id;
    t_record_data.record_id          := pur_req_operation_records_s.nextval;
    t_record_data.status             := p_status;
    t_record_data.status_desc        := p_status_desc;
    t_record_data.operation_table    := p_operation_table;
    t_record_data.operation_table_id := p_operation_table_id;
    t_record_data.created_by         := p_user_id;
    t_record_data.creation_date      := sysdate;
    t_record_data.last_updated_by    := p_user_id;
    t_record_data.last_update_date   := sysdate;
    insert into pur_req_operation_records values t_record_data;
  end operation_record;

  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 初始化合同条款
  **************************************************/
  procedure create_con_terms_init(p_contract_header_id number,
                                  p_contract_type_id   number,
                                  p_user_id            number) is
  begin
    for c_parent_data in (select l.*
                            from pur_con_types    t,
                                 pur_con_tplt_hds h,
                                 pur_con_tplt_lns l
                           where t.con_type_id = p_contract_type_id
                             and t.con_tplt_id = h.con_tplt_id
                             and h.con_tplt_id = l.con_tplt_id
                             and l.enabled_flag = 'Y'
                             and h.enabled_flag = 'Y'
                           ORDER BY l.sequence) loop
      create_cont_terms(p_contract_header_id => p_contract_header_id,
                        p_source_ref_id      => c_parent_data.con_item_id,
                        p_current_terms_id   => c_parent_data.con_item_id,
                        p_parent_terms_id    => c_parent_data.parent_item_id,
                        p_con_tplt_id        => c_parent_data.con_tplt_id,
                        p_terms_title        => c_parent_data.item_title,
                        p_terms_text         => c_parent_data.item_text,
                        p_sequence_num       => c_parent_data.sequence,
                        p_lock_flag          => c_parent_data.lock_flag,
                        p_user_id            => p_user_id);
    end loop;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '初始化合同条款信息失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'create_con_terms_init');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end create_con_terms_init;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 新增合同条款
  **************************************************/
  procedure create_cont_terms(p_contract_header_id number,
                              p_source_ref_id      number default null,
                              p_current_terms_id   number default null,
                              p_parent_terms_id    number default null,
                              p_con_tplt_id        number default null,
                              p_terms_title        varchar2 default null,
                              p_terms_text         varchar2 default null,
                              p_sequence_num       number default null,
                              p_lock_flag          varchar2 default null,
                              p_user_id            number) is
    t_terms_data con_contract_terms_new%rowtype;
    v_terms_id   number;
  begin
    --原模板行上的上下级关联两个字段，在转移到合同条款时存入 current_terms_id parent_terms_id字段
    --因为考虑到维护合同条款时会新增条款项，这样方便梳理上下级关系
    select con_contract_terms_new_s.nextval into v_terms_id from dual;
    t_terms_data.terms_id           := v_terms_id;
    t_terms_data.source_ref_id      := p_source_ref_id;
    t_terms_data.current_terms_id   := nvl(p_current_terms_id, v_terms_id);
    t_terms_data.parent_terms_id    := p_parent_terms_id;
    t_terms_data.contract_header_id := p_contract_header_id;
    t_terms_data.con_tplt_id        := p_con_tplt_id;
    t_terms_data.terms_title        := p_terms_title;
    t_terms_data.terms_text         := p_terms_text;
    t_terms_data.sequence_num       := p_sequence_num;
    t_terms_data.lock_flag          := p_lock_flag;
    t_terms_data.created_by         := p_user_id;
    t_terms_data.creation_date      := sysdate;
    t_terms_data.last_updated_by    := p_user_id;
    t_terms_data.last_update_date   := sysdate;
    insert into con_contract_terms_new values t_terms_data;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '创建合同条款信息失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'create_cont_terms');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end create_cont_terms;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 维护合同条款
  **************************************************/
  procedure update_cont_terms(p_terms_id     number,
                              p_sequence_num number default null,
                              p_terms_title  varchar2 default null,
                              p_terms_text   varchar2 default null,
                              p_user_id      number) is
    v_terms_text varchar2(4000);
  begin
    v_terms_text := p_terms_text;
    /*   if p_terms_text not like '*%' then
      v_terms_text := '*' || p_terms_text;
    end if;*/
    update con_contract_terms_new t
       set t.sequence_num     = p_sequence_num,
           t.terms_title      = p_terms_title,
           t.terms_text       = v_terms_text,
           t.last_updated_by  = p_user_id,
           t.last_update_date = sysdate
     where t.terms_id = p_terms_id;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '维护合同条款信息失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'update_cont_terms');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end update_cont_terms;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 删除合同条款
  **************************************************/
  procedure delete_cont_terms(p_terms_id number, p_user_id number) is
  begin
    --递归删除
    delete from con_contract_terms_new t
     where t.terms_id in
           (select a.terms_id
              from con_contract_terms_new a
             start with a.terms_id = p_terms_id
            connect by prior a.current_terms_id = a.parent_terms_id);
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '删除合同条款信息失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'delete_cont_terms');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end delete_cont_terms;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 运费维护
  **************************************************/
  procedure create_con_ship(p_contract_line_id  number,
                            p_line_num          number default null,
                            p_condition_type    varchar2 default null,
                            p_conditional_price number default null,
                            p_bill_company_id   number default null,
                            p_user_id           number) is
    t_ship_data jh_con_shipping_costs%rowtype;
  begin
    t_ship_data.costs_id          := jh_con_shipping_costs_s.nextval;
    t_ship_data.line_num          := p_line_num;
    t_ship_data.condition_type    := p_condition_type;
    t_ship_data.conditional_price := p_conditional_price;
    t_ship_data.bill_company_id   := p_bill_company_id;
    t_ship_data.creation_date     := sysdate;
    t_ship_data.created_by        := p_user_id;
    t_ship_data.last_update_date  := sysdate;
    t_ship_data.last_updated_by   := p_user_id;
    t_ship_data.contract_line_id  := p_contract_line_id;
    insert into jh_con_shipping_costs values t_ship_data;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '创建合同运费信息失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'create_con_ship');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end create_con_ship;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 运费维护
  **************************************************/
  procedure update_con_ship(p_costs_id          number,
                            p_line_num          number default null,
                            p_condition_type    varchar2 default null,
                            p_conditional_price number default null,
                            p_bill_company_id   number default null,
                            p_user_id           number) is
  begin
    update jh_con_shipping_costs t
       set t.line_num          = p_line_num,
           t.condition_type    = p_condition_type,
           t.conditional_price = p_conditional_price,
           t.bill_company_id   = p_bill_company_id,
           t.last_update_date  = sysdate,
           t.last_updated_by   = p_user_id
     where t.costs_id = p_costs_id;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '维护合同运费信息失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'update_con_ship');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end update_con_ship;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 付款信息
  **************************************************/
  procedure create_con_payment(p_contract_header_id number,
                               p_line_num           number default null,
                               p_payment_type       varchar2 default null,
                               p_payment_date       date default null,
                               p_payment_ratio      number default null,
                               p_user_id            number) is
    t_payment_data jh_con_payment_method%rowtype;
  begin
    t_payment_data.method_id          := jh_con_payment_method_s.nextval;
    t_payment_data.contract_header_id := p_contract_header_id;
    t_payment_data.line_num           := p_line_num;
    t_payment_data.payment_type       := p_payment_type;
    t_payment_data.payment_date       := p_payment_date;
    t_payment_data.payment_ratio      := p_payment_ratio;
    t_payment_data.created_by         := p_user_id;
    t_payment_data.last_update_date   := sysdate;
    t_payment_data.last_updated_by    := p_user_id;
    t_payment_data.last_update_date   := sysdate;
  
    insert into jh_con_payment_method values t_payment_data;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '创建合同付款信息失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'create_con_payment');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end create_con_payment;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 维护付款信息
  **************************************************/
  procedure update_con_payment(p_method_id     number,
                               p_line_num      number default null,
                               p_payment_type  varchar2 default null,
                               p_payment_date  date default null,
                               p_payment_ratio number default null,
                               p_user_id       number) is
  
  begin
    update jh_con_payment_method m
       set m.line_num         = p_line_num,
           m.payment_type     = p_payment_type,
           m.payment_date     = p_payment_date,
           m.payment_ratio    = p_payment_ratio,
           m.last_update_date = sysdate,
           m.last_updated_by  = p_user_id
     where m.method_id = p_method_id;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '维护合同付款信息失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'update_con_payment');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end update_con_payment;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 整单删除
  **************************************************/
  procedure delete_con_for_all(p_contract_header_id number,
                               p_user_id            number) is
  begin
    --删除附件信息
    for t_attm_data in (select a.con_attchment_id
                          from con_contract_attachments_new a
                         where a.contract_header_id = p_contract_header_id) loop
      delete_con_attm(p_con_attchment_id => t_attm_data.con_attchment_id,
                      p_user_id          => p_user_id);
    end loop;
    --删除条款信息
    delete from con_contract_terms_new t
     where t.contract_header_id = p_contract_header_id;
    --删除付款信息
    delete from jh_con_payment_method m
     where m.contract_header_id = p_contract_header_id;
    --删除开票方
    delete from con_contract_partners_new p
     where p.contract_header_id = p_contract_header_id;
    --删除合同标的
    for t_line_data in (select l.contract_line_id,
                               l.source_ref_id,
                               l.source_ref_type,
                               l.plan_line_id,
                               l.quantity
                          from con_contract_lines_new l
                         where l.contract_header_id = p_contract_header_id) loop
      --释放寻源
      release_source_plan(p_contract_line_id => t_line_data.contract_line_id,
                          p_user_id          => p_user_id);
      --删除运费信息
      delete from jh_con_shipping_costs t
       where t.contract_line_id = t_line_data.contract_line_id;
      --删除合同标的
      delete from con_contract_lines_new l
       where l.contract_line_id = t_line_data.contract_line_id;
    end loop;
    --删除合同头
    delete from con_contract_headers_new h
     where h.contract_header_id = p_contract_header_id;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '整单删除失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'delete_con_for_all');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end delete_con_for_all;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 提交合同
  **************************************************/
  procedure submit_con(p_contract_header_id number, p_user_id number) is
    v_status varchar2(100);
    e_error exception;
    v_message            varchar2(1000);
    v_count              number;
    v_framework_contract varchar2(100);
  begin
    --校验合同状态是否发生变更
    select h.status, h.framework_contract
      into v_status, v_framework_contract
      from con_contract_headers_new h
     where h.contract_header_id = p_contract_header_id;
    if v_status not in (c_jh_con_new_status,
                        c_jh_con_returned_status,
                        c_jh_con_rejected_status) then
      v_message := '当前合同状态已发生变更，请检查！';
      raise e_error;
    end if;
    --校验附件是否维护了行但没有上传附件
    for t_attm_data in (select c.con_attchment_id, c.line_num
                          from con_contract_attachments_new c
                         where c.contract_header_id = p_contract_header_id) loop
      select count(1)
        into v_count
        from fnd_atm_attachment_multi fa
       where fa.table_pk_value = t_attm_data.con_attchment_id
         and fa.table_name = 'CON_CONTRACT_ATTACHMENTS_NEW';
      if v_count = 0 then
        v_message := '附件信息：第 ' || t_attm_data.line_num || ' 行，未上传附件，请检查！';
        raise e_error;
      end if;
    end loop;
    --------------------------------------------------------
    --提交合同前，根据框架合同类型更新物料行上的价格或数量
    if v_framework_contract = 'DLBDJ' then
      --定量不定价：校验数量是否填写
      update con_contract_lines_new l
         set l.price_tax = '', l.amount_tax = ''
       where l.contract_header_id = p_contract_header_id;
    elsif v_framework_contract = 'DJBDL' then
      --定价不定量：校验价格是否填写
      update con_contract_lines_new l
         set l.quantity = '', l.amount_tax = ''
       where l.contract_header_id = p_contract_header_id;
    elsif v_framework_contract = 'BDLBDJ' then
      --不定量不定价
      update con_contract_lines_new l
         set l.quantity = '', l.price_tax = '', l.amount_tax = ''
       where l.contract_header_id = p_contract_header_id;
    end if;
    --校验数量或者价格是否填写
    for t_data in (select l.quantity, l.price_tax, l.line_num
                     from con_contract_lines_new l
                    where l.contract_header_id = p_contract_header_id) loop
      if v_framework_contract = 'DLBDJ' then
        if t_data.quantity is null then
          v_message := '第 ' || t_data.line_num || ' 行，数量未填写！';
        end if;
      elsif v_framework_contract = 'DJBDL' then
        if t_data.price_tax is null then
          v_message := '第 ' || t_data.line_num || ' 行，价格未填写！';
        end if;
      elsif v_framework_contract is null or v_framework_contract = 'DJDL' then
        if t_data.quantity is null then
          v_message := '第 ' || t_data.line_num || ' 行，数量未填写！';
        end if;
        if t_data.price_tax is null then
          v_message := '第 ' || t_data.line_num || ' 行，价格未填写！';
        end if;
      end if;
    end loop;
    if v_message is not null then
      raise e_error;
    end if;
    ---------------------------------------------------------------------------
    --提交
    update con_contract_headers_new h
       set h.status           = c_jh_con_submitted_status,
           h.last_updated_by  = p_user_id,
           h.last_update_date = sysdate
     where h.contract_header_id = p_contract_header_id;
    --操作记录
    operation_record(p_operation_table    => 'con_contract_headers_new',
                     p_operation_table_id => p_contract_header_id,
                     p_status             => c_jh_con_submitted_status,
                     p_status_desc        => '提交',
                     p_user_id            => p_user_id);
    --邮件
    evt_event_core_pkg.fire_event(p_event_name  => 'JH_CON_SUBMIT',
                                  p_event_param => p_contract_header_id,
                                  p_created_by  => p_user_id);
  exception
    when e_error then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => v_message,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'submit_con');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '提交合同失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'submit_con');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end submit_con;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 取消合同操作
  **************************************************/
  procedure cancel_con(p_contract_header_id number,
                       p_status             varchar2,
                       p_user_id            number) is
    v_status varchar2(100);
    e_error exception;
    v_message varchar2(1000);
    v_count   number;
  begin
    --校验合同状态是否发生变更
    select h.status
      into v_status
      from con_contract_headers_new h
     where h.contract_header_id = p_contract_header_id;
    if v_status in (c_jh_con_canceled_status) then
      v_message := '当前合同状态已发生变更，请检查！';
      raise e_error;
    end if;
    --校验是否创建过订单
    select count(1)
      into v_count
      from pur_headers_all h
     where h.contract_header_id = p_contract_header_id;
    if v_count <> 0 then
      v_message := '当前合同已创建订单，请先取消订单再进行取消合同操作！';
      raise e_error;
    end if;
    --释放采购计划上的寻已创建合同数量
    for t_line_data in (select l.contract_line_id,
                               l.plan_line_id,
                               l.quantity
                          from con_contract_lines_new l
                         where l.contract_header_id = p_contract_header_id) loop
      --释放寻源
      release_source_plan(p_contract_line_id => t_line_data.contract_line_id,
                          p_user_id          => p_user_id);
    end loop;
    --取消
    update con_contract_headers_new h
       set h.status           = p_status,
           h.last_updated_by  = p_user_id,
           h.last_update_date = sysdate
     where h.contract_header_id = p_contract_header_id;
    --操作记录
    operation_record(p_operation_table    => 'con_contract_headers_new',
                     p_operation_table_id => p_contract_header_id,
                     p_status             => p_status,
                     p_status_desc        => '取消',
                     p_user_id            => p_user_id);
  
  exception
    when e_error then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => v_message,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'cancel_con');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '取消合同失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'cancel_con');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end cancel_con;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 供应商合同操作
  **************************************************/
  procedure vendor_con_opt(p_contract_header_id number,
                           p_status             varchar2,
                           p_vendor_note        varchar2,
                           p_user_id            number) is
  
    v_status varchar2(100);
    e_error exception;
    v_status_desc     varchar2(100);
    v_message         varchar2(1000);
    v_count           number;
    v_vendor_note     varchar2(100);
    v_contract_number varchar2(100);
    v_event_name      varchar2(100);
  begin
    --校验合同状态是否发生变更
    select h.status, h.contract_number
      into v_status, v_contract_number
      from con_contract_headers_new h
     where h.contract_header_id = p_contract_header_id;
    if v_status not in
       (c_jh_con_submitted_status, c_jh_con_return_vendor_status) then
      v_message := '当前合同状态已发生变更，请检查！';
      raise e_error;
    end if;
    if p_status = c_jh_con_confirmed_status then
      v_status_desc := '确认';
      v_event_name  := 'JH_CON_CONFIRMED';
      --校验是否上传签约附件
      select count(1)
        into v_count
        from fnd_atm_attachment_multi fa
       where fa.table_pk_value = p_contract_header_id
         and fa.table_name = 'CON_CONTRACT_HEADERS_NEW';
      if v_count = 0 then
        v_message := '请先上传签约附件！';
        raise e_error;
      end if;
    elsif p_status = c_jh_con_returned_status then
      v_status_desc := '退回';
      v_vendor_note := p_vendor_note;
      v_event_name  := 'JH_CON_RETURNED';
    end if;
    --确认/退回
    update con_contract_headers_new h
       set h.status           = p_status,
           h.vendor_note      = v_vendor_note,
           h.last_updated_by  = p_user_id,
           h.last_update_date = sysdate
     where h.contract_header_id = p_contract_header_id;
    --操作记录
    operation_record(p_operation_table    => 'con_contract_headers_new',
                     p_operation_table_id => p_contract_header_id,
                     p_status             => p_status,
                     p_status_desc        => v_status_desc,
                     p_user_id            => p_user_id);
    --邮件
    evt_event_core_pkg.fire_event(p_event_name  => v_event_name,
                                  p_event_param => p_contract_header_id,
                                  p_created_by  => p_user_id);
  exception
    when e_error then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => v_message,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'vendor_con_opt');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '操作失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'vendor_con_opt');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end vendor_con_opt;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 审批合同操作
  **************************************************/
  procedure approve_con_opt(p_contract_header_id number,
                            p_status             varchar2,
                            p_vendor_note        varchar2 default null,
                            p_user_id            number) is
  
    v_status varchar2(100);
    e_error exception;
    v_status_desc        varchar2(100);
    v_message            varchar2(1000);
    v_return_vendor_note varchar2(100);
    v_contract_number    varchar2(100);
    v_terms_detail       varchar2(3000);
  begin
    --校验合同状态是否发生变更
    select h.status, h.contract_number
      into v_status, v_contract_number
      from con_contract_headers_new h
     where h.contract_header_id = p_contract_header_id;
    if v_status <> c_jh_con_confirmed_status then
      v_message := '当前合同状态已发生变更，请检查！';
      raise e_error;
    end if;
    if p_status = c_jh_con_approving_status then
      v_status_desc  := '审批中';
      v_terms_detail := p_vendor_note;
    elsif p_status = c_jh_con_return_vendor_status then
      v_status_desc        := '复核退回';
      v_return_vendor_note := p_vendor_note;
      --邮件
      evt_event_core_pkg.fire_event(p_event_name  => 'JH_CON_RE_RETURNED',
                                    p_event_param => p_contract_header_id,
                                    p_created_by  => p_user_id);
    end if;
    --提交至OA审批/退回至供应商
    update con_contract_headers_new h
       set h.status             = p_status,
           h.return_vendor_note = v_return_vendor_note,
           h.terms_detail       = v_terms_detail,
           h.last_updated_by    = p_user_id,
           h.last_update_date   = sysdate
     where h.contract_header_id = p_contract_header_id;
    --操作记录
    operation_record(p_operation_table    => 'con_contract_headers_new',
                     p_operation_table_id => p_contract_header_id,
                     p_status             => p_status,
                     p_status_desc        => v_status_desc,
                     p_user_id            => p_user_id);
    --20180102:处理完成之后默认将合同直接改成已完成状态，跳过OA审批方便测试，后期要删除此逻辑
    if p_status = c_jh_con_approving_status then
      oa_return(p_document_number => v_contract_number,
                p_document_result => 'Y',
                p_user_id         => p_user_id);
    end if;
    ----------------------------------------------------
  exception
    when e_error then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => v_message,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'approve_con_opt');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '操作失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'approve_con_opt');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end approve_con_opt;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 附件创建
  **************************************************/
  procedure create_con_attm(p_contract_header_id number,
                            p_line_num           number default null,
                            p_file_name          varchar2 default null,
                            p_upload_party       number default null,
                            p_upload_date        date default null,
                            p_comments           varchar2 default null,
                            p_user_id            number) is
    t_attm_data con_contract_attachments_new%rowtype;
  begin
    t_attm_data.con_attchment_id   := con_contract_attachments_new_s.nextval;
    t_attm_data.contract_header_id := p_contract_header_id;
    t_attm_data.file_name          := p_file_name;
    t_attm_data.upload_party       := p_upload_party;
    t_attm_data.upload_date        := p_upload_date;
    t_attm_data.comments           := p_comments;
    t_attm_data.line_num           := p_line_num;
    t_attm_data.created_by         := p_user_id;
    t_attm_data.last_update_date   := sysdate;
    t_attm_data.last_updated_by    := p_user_id;
    t_attm_data.last_update_date   := sysdate;
    insert into con_contract_attachments_new values t_attm_data;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '创建附件信息失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'create_con_attm');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end create_con_attm;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 附件维护
  **************************************************/
  procedure update_con_attm(p_con_attchment_id number,
                            p_line_num         number default null,
                            p_file_name        varchar2 default null,
                            p_upload_party     number default null,
                            p_upload_date      date default null,
                            p_comments         varchar2 default null,
                            p_user_id          number) is
  begin
    update con_contract_attachments_new a
       set a.line_num         = p_line_num,
           a.file_name        = p_file_name,
           a.upload_party     = p_upload_party,
           a.upload_date      = p_upload_date,
           a.comments         = p_comments,
           a.last_updated_by  = p_user_id,
           a.last_update_date = sysdate
     where a.con_attchment_id = p_con_attchment_id;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '维护附件信息失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'update_con_attm');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end update_con_attm;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 附件删除
  **************************************************/
  procedure delete_con_attm(p_con_attchment_id number, p_user_id number) is
  begin
    --删除附件文档表  fnd_atm_attachment
    delete from fnd_atm_attachment aa
     where aa.source_pk_value in
           (select am.record_id
              from fnd_atm_attachment_multi am
             where am.table_pk_value = p_con_attchment_id
               and am.table_name = 'CON_CONTRACT_ATTACHMENTS_NEW');
    --删除附件文档和单据关联明细表fnd_atm_attachment_multi
    delete from fnd_atm_attachment_multi am
     where am.table_pk_value = p_con_attchment_id
       and am.table_name = 'CON_CONTRACT_ATTACHMENTS_NEW';
    --删除该行信息
    delete from con_contract_attachments_new a
     where a.con_attchment_id = p_con_attchment_id;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '删除附件信息失败！请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'delete_con_attm');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end delete_con_attm;

  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 系统请求：将已过期的合同进行过期处理
  **************************************************/
  procedure auto_expired(p_request_id NUMBER) is
  
  begin
    --查询所有已过期的数据
    for t_data in (select h.contract_header_id
                     from con_contract_headers_new h
                    where to_date(TO_CHAR(h.end_date, 'yyyy-mm-dd'),
                                  'yyyy-mm-dd') <
                          to_date(TO_CHAR(sysdate, 'yyyy-mm-dd'),
                                  'yyyy-mm-dd')
                      and h.status <> c_jh_con_expired_status) loop
      --过期
      update con_contract_headers_new h
         set h.status           = c_jh_con_expired_status,
             h.last_updated_by  = 1,
             h.last_update_date = sysdate
       where h.contract_header_id = t_data.contract_header_id;
      --操作记录
      operation_record(p_operation_table    => 'con_contract_headers_new',
                       p_operation_table_id => t_data.contract_header_id,
                       p_status             => c_jh_con_expired_status,
                       p_status_desc        => '过期',
                       p_user_id            => 1);
    end loop;
  end auto_expired;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 释放寻源行数据和采购计划行数量：整单删除和取消合同会用到
  **************************************************/
  procedure release_source_plan(p_contract_line_id number,
                                p_user_id          number) is
    t_data con_contract_lines_new%rowtype;
  begin
    select *
      into t_data
      from con_contract_lines_new l
     where l.contract_line_id = p_contract_line_id;
    --去除寻源行创建合同标记
    if t_data.source_ref_type is not null then
      if t_data.source_ref_type like '%BID' then
        update bid_bidding_docm_lines l
           set l.create_con_flag  = 'N',
               l.last_update_date = sysdate,
               l.last_updated_by  = p_user_id
         where l.bid_line_id = t_data.source_ref_id;
      else
        update pur_rfx_feedback_lines l
           set l.create_con_flag  = 'N',
               l.last_update_date = sysdate,
               l.last_updated_by  = p_user_id
         where l.feedback_line_id = t_data.source_ref_id;
      end if;
    end if;
    --释放采购计划上的已创建合同数量
    if t_data.plan_line_id is not null then
      update jh_pur_plan_line l
         set l.contract_quantity = nvl(l.contract_quantity, 0) -
                                   t_data.quantity,
             l.last_update_date  = sysdate,
             l.last_updated_by   = p_user_id
       where l.line_id = t_data.plan_line_id;
    end if;
  end release_source_plan;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : OA审批回写:p_document_opt：
               Y表示审批通过，N表示审批拒绝
  **************************************************/
  procedure oa_return(p_document_number varchar2,
                      p_document_result varchar2,
                      p_attribute1      varchar2 default null,
                      p_attribute2      varchar2 default null,
                      p_attribute3      varchar2 default null,
                      p_attribute4      varchar2 default null,
                      p_attribute5      varchar2 default null,
                      p_attribute6      varchar2 default null,
                      p_attribute7      varchar2 default null,
                      p_attribute8      varchar2 default null,
                      p_attribute9      varchar2 default null,
                      p_attribute10     varchar2 default null,
                      p_user_id         NUMBER) is
    v_status             varchar2(100);
    v_contract_header_id number;
  begin
    /*
    传OA审批的是只传供应商确认的合同
    */
    if p_document_result = 'A' then
      --OA流程开始
      update con_contract_headers_new h
         set h.oa_start_flag = 'Y'
       where h.contract_number = p_document_number;
    else
      if p_document_result = 'Y' then
        v_status := c_jh_con_finished_status;
      else
        v_status := c_jh_con_rejected_status;
      end if;
      update con_contract_headers_new h
         set h.status           = v_status,
             h.oa_start_flag    = '',
             h.last_updated_by  = p_user_id,
             h.last_update_date = sysdate
       where h.contract_number = p_document_number;
      select h.contract_header_id
        into v_contract_header_id
        from con_contract_headers_new h
       where h.contract_number = p_document_number;
      --邮件
      evt_event_core_pkg.fire_event(p_event_name  => 'JH_CON_OA_APPROVED',
                                    p_event_param => v_contract_header_id,
                                    p_created_by  => p_user_id);
    end if;
  end oa_return;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 自定义合同编号
  **************************************************/
  function get_cont_number(p_contract_type_id number, p_user_id number)
    return varchar2 is
    v_type_code      varchar2(100);
    v_init_length    number;
    v_init_flag      varchar2(1);
    v_current_month  varchar2(100);
    v_current_number varchar2(100);
    v_cont_number    varchar2(100);
  begin
    --初始化流水号为 3
    v_init_length := 3;
    --获取合同类型编码
    SELECT p.type_code
      into v_type_code
      FROM pur_con_types p
     WHERE p.con_type_id = p_contract_type_id;
    --取当前年月
    select to_char(sysdate, 'YYYYMMDD') into v_current_month from dual;
    --查询是否存在当前合同类型当前年月对应的单据编号
    begin
      select max(substr(h.contract_number,
                        length(h.contract_number) - v_init_length + 1,
                        v_init_length))
        into v_current_number
        from con_contract_headers_new h
       where h.contract_number like v_type_code || v_current_month || '%';
    exception
      when no_data_found then
        --如果没有数据则返回当前年月的初始编号
        v_init_flag := 'Y';
    end;
    --如果最大编号为空，也返回当前月初始编号
    if v_current_number is null then
      v_init_flag := 'Y';
    end if;
    --如果初始标记为Y则返回初始编号
    if v_init_flag = 'Y' then
      v_cont_number := v_type_code || v_current_month ||
                       lpad(1, v_init_length, 0);
    else
      --否则返回最大编号+1
      v_cont_number := v_type_code || v_current_month ||
                       lpad(to_number(v_current_number) + 1,
                            v_init_length,
                            0);
    end if;
    return v_cont_number;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '生成合同编号失败，请联系管理员!',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'get_cont_number');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end get_cont_number;

  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 合同外部供应商定义
  **************************************************/
  procedure cont_external_vendor_insert(p_vendor_id      number,
                                        p_vendor_code    varchar2,
                                        p_vendor_desc    varchar2,
                                        p_business_group varchar2,
                                        p_attribute1     varchar2 default null,
                                        p_attribute2     varchar2 default null,
                                        p_attribute3     varchar2 default null,
                                        p_attribute4     varchar2 default null,
                                        p_attribute5     varchar2 default null,
                                        p_attribute6     varchar2 default null,
                                        p_attribute7     varchar2 default null,
                                        p_attribute8     varchar2 default null,
                                        p_attribute9     varchar2 default null,
                                        p_attribute10    varchar2 default null,
                                        p_user_id        number) is
    t_ext_data jh_cont_external_vendor%rowtype;
    v_count    number;
    e_error exception;
  begin
    select count(1)
      into v_count
      from jh_cont_external_vendor v
     where v.vendor_id = p_vendor_id
       and v.business_group = p_business_group;
    if v_count <> 0 then
      raise e_error;
    end if;
    t_ext_data.ext_id           := jh_cont_external_vendor_s.nextval;
    t_ext_data.vendor_id        := p_vendor_id;
    t_ext_data.vendor_code      := p_vendor_code;
    t_ext_data.vendor_desc      := p_vendor_desc;
    t_ext_data.business_group   := p_business_group;
    t_ext_data.attribute1       := p_attribute1;
    t_ext_data.attribute2       := p_attribute2;
    t_ext_data.attribute3       := p_attribute3;
    t_ext_data.attribute4       := p_attribute4;
    t_ext_data.attribute5       := p_attribute5;
    t_ext_data.attribute6       := p_attribute6;
    t_ext_data.attribute7       := p_attribute7;
    t_ext_data.attribute8       := p_attribute8;
    t_ext_data.attribute9       := p_attribute9;
    t_ext_data.attribute10      := p_attribute10;
    t_ext_data.creation_date    := sysdate;
    t_ext_data.created_by       := p_user_id;
    t_ext_data.last_update_date := sysdate;
    t_ext_data.last_updated_by  := p_user_id;
    insert into jh_cont_external_vendor values t_ext_data;
  exception
    when e_error then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '供应商：' ||
                                                                                  p_vendor_desc ||
                                                                                  '已存在，不能重复维护！',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'cont_external_vendor_insert');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '维护失败!请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'cont_external_vendor_insert');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end cont_external_vendor_insert;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 合同模板鎖定
  **************************************************/
  procedure con_tplt_lock_opt(p_con_item_id number,
                              p_opt_code    varchar2,
                              p_user_id     number) is
    v_lock_flag varchar2(100);
  begin
    if p_opt_code = 'LOCK' then
      v_lock_flag := 'Y';
    else
      v_lock_flag := 'N';
    end if;
    --将该数据和下级所有数据全部进行处理
    for t_data in (select p.con_item_id
                     from pur_con_tplt_lns p
                    where p.con_item_id in
                          (select t.con_item_id
                             from pur_con_tplt_lns t
                            start with t.con_item_id = p_con_item_id
                           connect by prior t.con_item_id = t.parent_item_id)) loop
      update pur_con_tplt_lns t
         set t.lock_flag        = v_lock_flag,
             t.last_updated_by  = p_user_id,
             t.last_update_date = sysdate
       where t.con_item_id = t_data.con_item_id;
    end loop;
  end con_tplt_lock_opt;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 合同模板复制
  **************************************************/
  procedure con_tplt_copy_opt(p_tplt_id NUMBER, p_user_id NUMBER) is
    t_head_data   pur_con_tplt_hds%rowtype;
    t_lns_data    pur_con_tplt_lns%rowtype;
    v_con_tplt_id number;
  begin
    --先创建一条合同模板头
    v_con_tplt_id                := pur_con_tplt_hds_s.nextval;
    t_head_data.con_tplt_id      := v_con_tplt_id;
    t_head_data.enabled_flag     := 'Y';
    t_head_data.created_by       := p_user_id;
    t_head_data.creation_date    := sysdate;
    t_head_data.last_updated_by  := p_user_id;
    t_head_data.last_update_date := sysdate;
    insert into pur_con_tplt_hds values t_head_data;
    --复制明细：先复制父条款
    for t_line_data in (SELECT *
                          FROM pur_con_tplt_lns t1
                         WHERE t1.con_tplt_id = p_tplt_id
                           and t1.parent_item_id is null
                         ORDER BY t1.sequence asc) loop
      t_lns_data.con_item_id      := pur_con_tplt_lns_s.nextval;
      t_lns_data.con_tplt_id      := v_con_tplt_id;
      t_lns_data.item_title       := t_line_data.item_title;
      t_lns_data.item_text        := t_line_data.item_text;
      t_lns_data.enabled_flag     := t_line_data.enabled_flag;
      t_lns_data.sequence         := t_line_data.sequence;
      t_lns_data.lock_flag        := t_line_data.lock_flag;
      t_lns_data.created_by       := p_user_id;
      t_lns_data.creation_date    := sysdate;
      t_lns_data.last_updated_by  := p_user_id;
      t_lns_data.last_update_date := sysdate;
      insert into pur_con_tplt_lns values t_lns_data;
    end loop;
    --复制子条款
    for t_line_data in (SELECT *
                          FROM pur_con_tplt_lns t1
                         WHERE t1.con_tplt_id = p_tplt_id
                           and t1.parent_item_id is not null
                         ORDER BY t1.sequence asc) loop
      --查询对应父条款的ID
      select l.con_item_id
        into t_lns_data.parent_item_id
        from pur_con_tplt_lns l
       where l.con_tplt_id = v_con_tplt_id
         and l.sequence =
             (select p.sequence
                from pur_con_tplt_lns p
               where p.con_item_id = t_line_data.parent_item_id);
      t_lns_data.con_item_id      := pur_con_tplt_lns_s.nextval;
      t_lns_data.con_tplt_id      := v_con_tplt_id;
      t_lns_data.item_title       := t_line_data.item_title;
      t_lns_data.item_text        := t_line_data.item_text;
      t_lns_data.enabled_flag     := t_line_data.enabled_flag;
      t_lns_data.sequence         := t_line_data.sequence;
      t_lns_data.lock_flag        := t_line_data.lock_flag;
      t_lns_data.created_by       := p_user_id;
      t_lns_data.creation_date    := sysdate;
      t_lns_data.last_updated_by  := p_user_id;
      t_lns_data.last_update_date := sysdate;
      insert into pur_con_tplt_lns values t_lns_data;
    end loop;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '复制出错，请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'con_tplt_copy_opt');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end con_tplt_copy_opt;

  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 合同提交通知供应商
  **************************************************/
  procedure get_con_vendor(p_message_id        NUMBER,
                           p_event_param       NUMBER,
                           p_recipient_id      NUMBER,
                           p_recipient_type_id NUMBER,
                           p_user_id           NUMBER) is
    v_email        VARCHAR2(100);
    v_mobile_phone VARCHAR2(100);
    v_user_id      NUMBER;
    v_description  VARCHAR2(100);
  begin
    for t_data in (select distinct su.user_id,
                                   su.user_name,
                                   su.email,
                                   su.description user_desc,
                                   su.mobile_phone
                     from con_contract_headers_new     h,
                          fnd_companies_vl             f,
                          sys_user                     su,
                          fnd_user_authority_company_v acv
                    where h.vendor_id = f.company_id
                      and f.business_group = su.business_group
                      and su.user_id = acv.user_id
                      and h.vendor_id = acv.assign_id
                      and nvl(su.frozen_flag, 'N') = 'N'
                      and su.start_date <= sysdate
                      and (su.end_date is null or su.end_date >= sysdate)
                      and h.contract_header_id = p_event_param) loop
    
      sys_notify_message_pkg.insert_notify_recipient(p_message_id        => p_message_id,
                                                     p_recipient_type_id => p_recipient_type_id,
                                                     p_recipient_user_id => t_data.user_id,
                                                     p_recipient_name    => t_data.user_desc,
                                                     p_recipient_mobile  => t_data.mobile_phone,
                                                     p_recipient_mail    => t_data.email,
                                                     p_created_by        => p_user_id);
    end loop;
  end get_con_vendor;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 获取合同创建人
  **************************************************/
  procedure get_con_create_by(p_message_id        NUMBER,
                              p_event_param       NUMBER,
                              p_recipient_id      NUMBER,
                              p_recipient_type_id NUMBER,
                              p_user_id           NUMBER) is
    v_email        VARCHAR2(100);
    v_mobile_phone VARCHAR2(100);
    v_user_id      NUMBER;
    v_user_desc    VARCHAR2(100);
  begin
    select su.user_id, su.email, su.description user_desc, su.mobile_phone
      into v_user_id, v_email, v_user_desc, v_mobile_phone
      from con_contract_headers_new h, sys_user su
     where su.user_id = h.created_by
       and nvl(su.frozen_flag, 'N') = 'N'
       and su.start_date <= sysdate
       and (su.end_date is null or su.end_date >= sysdate)
       and h.contract_header_id = p_event_param;
    sys_notify_message_pkg.insert_notify_recipient(p_message_id        => p_message_id,
                                                   p_recipient_type_id => p_recipient_type_id,
                                                   p_recipient_user_id => v_user_id,
                                                   p_recipient_name    => v_user_desc,
                                                   p_recipient_mobile  => v_mobile_phone,
                                                   p_recipient_mail    => v_email,
                                                   p_created_by        => p_user_id);
  end get_con_create_by;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 删除附录
  **************************************************/
  procedure delete_cont_appendix(p_appendix_id number, p_user_id number) is
  
  begin
    delete from jh_con_appendix_info p where p.appendix_id = p_appendix_id;
  end delete_cont_appendix;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 新增附录
  **************************************************/
  procedure create_cont_appendix(p_contract_header_id number,
                                 p_line_num           number,
                                 p_appendix_title     varchar2,
                                 p_appendix_text      clob,
                                 p_user_id            number) is
    t_data          jh_con_appendix_info%rowtype;
    v_count         number;
    t_appendix_text jh_split_string_pck.t_split_string;
  begin
    t_appendix_text := jh_split_string_pck.f_split_string(p_appendix_text,
                                                          '#');
    for i in t_appendix_text.first .. t_appendix_text.last loop
      t_data.appendix_id        := jh_con_appendix_info_s.nextval;
      t_data.contract_header_id := p_contract_header_id;
      t_data.line_num           := p_line_num;
      t_data.appendix_title     := p_appendix_title;
      t_data.appendix_text      := t_appendix_text(i);
      t_data.creation_date      := sysdate;
      t_data.created_by         := p_user_id;
      t_data.last_update_date   := sysdate;
      t_data.last_updated_by    := p_user_id;
      insert into jh_con_appendix_info values t_data;
    end loop;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'create_cont_appendix');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end create_cont_appendix;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 初始化新增附录：按行进行新增
  **************************************************/
  procedure create_cont_appendix_init(p_contract_header_id number,
                                      p_line_num           number,
                                      p_appendix_title     varchar2,
                                      p_appendix_text      varchar2,
                                      p_user_id            number) is
    t_data jh_con_appendix_info%rowtype;
  begin
    t_data.appendix_id        := jh_con_appendix_info_s.nextval;
    t_data.contract_header_id := p_contract_header_id;
    t_data.line_num           := p_line_num;
    t_data.appendix_title     := p_appendix_title;
    t_data.appendix_text      := p_appendix_text;
    t_data.creation_date      := sysdate;
    t_data.created_by         := p_user_id;
    t_data.last_update_date   := sysdate;
    t_data.last_updated_by    := p_user_id;
    insert into jh_con_appendix_info values t_data;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '维护附录出错，请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'create_cont_appendix_init');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end create_cont_appendix_init;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 更新附录
  **************************************************/
  procedure update_cont_appendix(p_contract_header_id number,
                                 p_line_num           number,
                                 p_appendix_title     varchar2,
                                 p_appendix_text      clob,
                                 p_user_id            number) is
  
  begin
    delete from jh_con_appendix_info p
     where p.contract_header_id = p_contract_header_id
       and p.line_num = p_line_num;
    create_cont_appendix(p_contract_header_id => p_contract_header_id,
                         p_line_num           => p_line_num,
                         p_appendix_title     => p_appendix_title,
                         p_appendix_text      => p_appendix_text,
                         p_user_id            => p_user_id);
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '维护附录出错，请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'update_cont_appendix');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end update_cont_appendix;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 整单创建合同
  **************************************************/
  procedure create_cont_for_all_line(o_con_head_id_list     out varchar2,
                                     o_contract_number_list out varchar2,
                                     p_source_type          varchar2,
                                     p_source_number        varchar2,
                                     p_user_id              number,
                                     p_business_group       varchar2) is
    t_head_data con_contract_headers_new%rowtype;
  begin
    --判断寻源类型
    if p_source_type like '%BID' then
      --招投标：
      create_cont_for_all_bid(o_con_head_id_list     => o_con_head_id_list,
                              o_contract_number_list => o_contract_number_list,
                              p_source_number        => p_source_number,
                              p_user_id              => p_user_id,
                              p_business_group       => p_business_group);
    else
      --询报价
      create_cont_for_all_rfx(o_con_head_id_list     => o_con_head_id_list,
                              o_contract_number_list => o_contract_number_list,
                              p_source_number        => p_source_number,
                              p_user_id              => p_user_id,
                              p_business_group       => p_business_group);
    end if;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => '整单创建出错，请联系管理员',
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_jh_con_pkg,
                                                     p_procedure_function_name => 'create_cont_for_all_line');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end create_cont_for_all_line;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 整单创建合同：招投标
  **************************************************/
  procedure create_cont_for_all_bid(o_con_head_id_list     out varchar2,
                                    o_contract_number_list out varchar2,
                                    p_source_number        varchar2,
                                    p_user_id              number,
                                    p_business_group       varchar2) is
    v_con_head_id     number;
    v_contract_number varchar2(100);
  begin
    --根据不同供应商创建不同合同
    for t_bid_data in (SELECT distinct f.company_id vendor_id
                         FROM bid_entrustment_headers  h,
                              bid_entrustment_ln_items l,
                              bid_bidding_docm_headers dh,
                              bid_bidding_docm_lines   dl,
                              fnd_companies_vl         f
                        WHERE h.entrustment_header_id =
                              l.entrustment_header_id
                          AND h.status = 'FINISHED'
                          AND NVL(dl.create_con_flag, 'N') = 'N'
                          AND dh.entrustment_header_id =
                              h.entrustment_header_id
                          AND dh.bid_header_id = dl.bid_header_id
                          AND dh.round = h.round
                          AND dl.entrustment_line_item_id = l.line_item_id
                          AND dl.success_bid_quantity > 0
                          AND dh.owner_company_id = f.company_id
                          AND h.created_by = p_user_id
                          AND h.owner_business_group = p_business_group
                          and h.entrustment_header_number = p_source_number) loop
      v_con_head_id := null;
      for t_bid_line_data in (SELECT h.entrustment_header_id source_header_id,
                                     t.entrustment_type_code source_type,
                                     t.entrustment_type_desc source_type_desc,
                                     h.entrustment_header_number source_number,
                                     l.line_item_id,
                                     l.line_num,
                                     h.round,
                                     f.company_id vendor_id,
                                     f.company_code vendor_code,
                                     f.company_full_name vendor_name,
                                     h.owner_company_id company_id,
                                     (SELECT fb.business_unit_id
                                        FROM fnd_business_units_vl fb
                                       WHERE fb.company_id =
                                             h.using_company_id
                                         AND fb.enabled_flag = 'Y') business_unit_id,
                                     (SELECT fb.business_unit_name
                                        FROM fnd_business_units_vl fb
                                       WHERE fb.company_id =
                                             h.using_company_id
                                         AND fb.enabled_flag = 'Y') business_unit_name,
                                     i.inv_organization_id,
                                     i.description inv_organization_name,
                                     l.item_id,
                                     l.item_code,
                                     l.item_desc,
                                     dl.tax_type_id,
                                     dl.tax_type_rate tax_rate,
                                     l.item_category_id category_id,
                                     dl.success_bid_quantity quantity,
                                     dl.unit_price price_tax,
                                     l.uom_code,
                                     (SELECT fv.uom_desc
                                        FROM fnd_uom_codes_vl fv
                                       WHERE fv.uom_code = l.uom_code
                                         AND fv.business_group =
                                             h.owner_business_group) uom_desc,
                                     h.currency_code,
                                     TO_CHAR(l.need_by_date, 'yyyy-mm-dd') need_by_date,
                                     u.description create_by,
                                     l.plan_head_id,
                                     l.pur_plan_number,
                                     l.plan_line_id,
                                     l.plan_line_num,
                                     (SELECT u.unit_desc
                                        FROM jh_pur_plan_head        p,
                                             hrm_employee_user_v     e,
                                             hrm_employee_position_v t,
                                             hrm_units_vl            u
                                       WHERE p.apply_employee_id =
                                             e.employee_id
                                         AND e.employee_id = t.employee_id
                                         AND t.primary_position_flag = 'Y'
                                         AND t.employee_enabled_flag = 'Y'
                                         AND t.unit_id = u.unit_id
                                         AND u.enabled_flag = 'Y'
                                         AND u.business_group =
                                             p.business_group
                                         AND p.head_id = l.plan_head_id) apply_dept_desc,
                                     (SELECT e.name
                                        FROM jh_pur_plan_head        p,
                                             hrm_employee_user_v     e,
                                             hrm_employee_position_v t,
                                             hrm_units_vl            u
                                       WHERE p.apply_employee_id =
                                             e.employee_id
                                         AND e.employee_id = t.employee_id
                                         AND t.primary_position_flag = 'Y'
                                         AND t.employee_enabled_flag = 'Y'
                                         AND t.unit_id = u.unit_id
                                         AND u.enabled_flag = 'Y'
                                         AND u.business_group =
                                             p.business_group
                                         AND p.head_id = l.plan_head_id) apply_employee_desc,
                                     dl.bid_line_id source_line_id,
                                     h.pur_organization_id,
                                     (SELECT p.pur_organization_code
                                        FROM pur_organizations_vl p
                                       WHERE p.pur_organization_id =
                                             h.pur_organization_id) pur_organization_code,
                                     (SELECT p.description
                                        FROM pur_organizations_vl p
                                       WHERE p.pur_organization_id =
                                             h.pur_organization_id) pur_organization_desc,
                                     '' shipping_costs_bear,
                                     '' shipping_costs_bear_desc,
                                     '' settlement_method,
                                     '' settlement_method_desc,
                                     '' payment_method,
                                     '' payment_method_desc
                                FROM bid_entrustment_headers  h,
                                     bid_entrustment_ln_items l,
                                     bid_entrustment_types_vl t,
                                     bid_bidding_docm_headers dh,
                                     bid_bidding_docm_lines   dl,
                                     fnd_companies_vl         f,
                                     inv_organizations_vl     i,
                                     sys_user                 u
                               WHERE h.entrustment_header_id =
                                     l.entrustment_header_id
                                 AND h.status = 'FINISHED'
                                 AND NVL(dl.create_con_flag, 'N') = 'N'
                                 AND t.enabled_flag = 'Y'
                                 AND t.entrustment_type_id =
                                     h.entrustment_type_id
                                 AND t.business_group =
                                     h.owner_business_group
                                 AND dh.entrustment_header_id =
                                     h.entrustment_header_id
                                 AND dh.bid_header_id = dl.bid_header_id
                                 AND dh.round = h.round
                                 AND dl.entrustment_line_item_id =
                                     l.line_item_id
                                 AND dl.success_bid_quantity > 0
                                 AND dh.owner_company_id = f.company_id
                                 AND h.created_by = u.user_id
                                 AND l.inv_organization_id =
                                     i.inv_organization_id
                                 AND h.created_by = p_user_id
                                 AND h.owner_business_group =
                                     p_business_group
                                 and h.entrustment_header_number =
                                     p_source_number
                                 and f.company_id = t_bid_data.vendor_id) loop
        --如果已经创建了合同头则不用重复创建
        if v_con_head_id is null then
          --创建合同头
          create_cont_head(o_contract_header_id  => v_con_head_id,
                           o_contract_number     => v_contract_number,
                           p_vendor_id           => t_bid_line_data.vendor_id,
                           p_business_unit_id    => t_bid_line_data.business_unit_id,
                           p_company_id          => t_bid_line_data.company_id,
                           p_inv_organization_id => t_bid_line_data.inv_organization_id,
                           p_shipping_costs_bear => t_bid_line_data.shipping_costs_bear,
                           p_settlement_method   => t_bid_line_data.settlement_method,
                           p_payment_method      => t_bid_line_data.payment_method,
                           p_is_manual           => 'N',
                           p_history_source_flag => 'N',
                           p_user_id             => p_user_id,
                           p_business_group      => p_business_group);
        end if;
        --创建合同行
        create_cont_line(p_contract_header_id  => v_con_head_id,
                         p_source_type         => t_bid_line_data.source_type,
                         p_source_line_id      => t_bid_line_data.source_line_id,
                         p_item_id             => t_bid_line_data.item_id,
                         p_item_code           => t_bid_line_data.item_code,
                         p_item_desc           => t_bid_line_data.item_desc,
                         p_category_id         => t_bid_line_data.category_id,
                         p_inv_organization_id => t_bid_line_data.inv_organization_id,
                         p_quantity            => t_bid_line_data.quantity,
                         p_uom_code            => t_bid_line_data.uom_code,
                         p_tax_rate            => t_bid_line_data.tax_rate,
                         p_tax_type_id         => t_bid_line_data.tax_type_id,
                         p_price_tax           => t_bid_line_data.price_tax,
                         p_plan_head_id        => t_bid_line_data.plan_head_id,
                         p_pur_plan_number     => t_bid_line_data.pur_plan_number,
                         p_plan_line_id        => t_bid_line_data.plan_line_id,
                         p_plan_line_num       => t_bid_line_data.plan_line_num,
                         p_user_id             => p_user_id);
      end loop;
      --由于会有多个供应商情况，所以这里返回的是拼接的合同号
      if o_con_head_id_list is null then
        o_con_head_id_list := v_con_head_id;
      else
        o_con_head_id_list := o_con_head_id_list || '/' || v_con_head_id;
      end if;
      if o_contract_number_list is null then
        o_contract_number_list := v_contract_number;
      else
        o_contract_number_list := o_contract_number_list || '/' ||
                                  v_contract_number;
      end if;
    end loop;
  end create_cont_for_all_bid;
  /*************************************************
  -- author  : zhangxin
  -- created : 2017/11/30 
  -- ver     : 1.1
  -- purpose : 整单创建合同：询报价
  **************************************************/
  procedure create_cont_for_all_rfx(o_con_head_id_list     out varchar2,
                                    o_contract_number_list out varchar2,
                                    p_source_number        varchar2,
                                    p_user_id              number,
                                    p_business_group       varchar2) is
    v_con_head_id     number;
    v_contract_number varchar2(100);
  begin
    --根据不同供应商创建不同合同
    for t_rfx_data in (SELECT distinct f.company_id vendor_id
                         FROM pur_rfx_headers          h,
                              pur_rfx_ln_items         l,
                              fnd_companies_vl         f,
                              pur_rfx_feedback_headers fh,
                              pur_rfx_feedback_lines   fl
                        WHERE h.rfx_header_id = l.rfx_header_id
                          AND h.status = 'FINISHED'
                          AND NVL(fl.create_con_flag, 'N') = 'N'
                          AND fh.rfx_header_id = h.rfx_header_id
                          AND fh.feedback_header_id = fl.feedback_header_id
                          AND fl.rfx_line_item_id = l.rfx_line_item_id
                          AND fh.rfx_round = h.round
                          AND fh.rfx_version = h.version
                          AND fh.coop_company_id = f.company_id
                          AND fl.suggested_flag = 'Y'
                          AND h.created_by = p_user_id
                          AND h.owner_business_group = p_business_group
                          and h.rfx_number = p_source_number) loop
      v_con_head_id := null;
      for t_rfx_line_data in (SELECT h.rfx_header_id source_header_id,
                                     h.rfx_category source_type,
                                     (SELECT v.rfx_type_desc
                                        FROM pur_bg_rfx_types_vl v
                                       WHERE v.enabled_flag = 'Y'
                                         AND v.rfx_category = h.rfx_category
                                         AND v.business_group =
                                             h.owner_business_group) source_type_desc,
                                     h.rfx_number source_number,
                                     l.rfx_line_item_id,
                                     l.line_num,
                                     h.round,
                                     f.company_id vendor_id,
                                     f.company_code vendor_code,
                                     f.company_full_name vendor_name,
                                     h.owner_company_id company_id,
                                     b.business_unit_id,
                                     b.business_unit_name,
                                     i.inv_organization_id,
                                     i.description inv_organization_name,
                                     l.item_id,
                                     l.item_code,
                                     l.item_desc,
                                     fl.tax_type_id,
                                     fl.tax_type_rate tax_rate,
                                     l.item_category_id category_id,
                                     fl.allotted_quantity quantity,
                                     fl.valid_fb_retail_price price_tax,
                                     l.uom_code,
                                     (SELECT fv.uom_desc
                                        FROM fnd_uom_codes_vl fv
                                       WHERE fv.uom_code = l.uom_code
                                         AND fv.business_group =
                                             h.owner_business_group) uom_desc,
                                     h.currency_code,
                                     TO_CHAR(l.need_by_date, 'yyyy-mm-dd') need_by_date,
                                     u.description create_by,
                                     l.plan_head_id,
                                     l.pur_plan_number,
                                     l.plan_line_id,
                                     l.plan_line_num,
                                     (SELECT u.unit_desc
                                        FROM jh_pur_plan_head        p,
                                             hrm_employee_user_v     e,
                                             hrm_employee_position_v t,
                                             hrm_units_vl            u
                                       WHERE p.apply_employee_id =
                                             e.employee_id
                                         AND e.employee_id = t.employee_id
                                         AND t.primary_position_flag = 'Y'
                                         AND t.employee_enabled_flag = 'Y'
                                         AND t.unit_id = u.unit_id
                                         AND u.enabled_flag = 'Y'
                                         AND u.business_group =
                                             p.business_group
                                         AND p.head_id = l.plan_head_id) apply_dept_desc,
                                     (SELECT e.name
                                        FROM jh_pur_plan_head        p,
                                             hrm_employee_user_v     e,
                                             hrm_employee_position_v t,
                                             hrm_units_vl            u
                                       WHERE p.apply_employee_id =
                                             e.employee_id
                                         AND e.employee_id = t.employee_id
                                         AND t.primary_position_flag = 'Y'
                                         AND t.employee_enabled_flag = 'Y'
                                         AND t.unit_id = u.unit_id
                                         AND u.enabled_flag = 'Y'
                                         AND u.business_group =
                                             p.business_group
                                         AND p.head_id = l.plan_head_id) apply_employee_desc,
                                     fl.feedback_line_id source_line_id,
                                     h.pur_organization_id,
                                     (SELECT p.pur_organization_code
                                        FROM pur_organizations_vl p
                                       WHERE p.pur_organization_id =
                                             h.pur_organization_id) pur_organization_code,
                                     (SELECT p.description
                                        FROM pur_organizations_vl p
                                       WHERE p.pur_organization_id =
                                             h.pur_organization_id) pur_organization_desc,
                                     DECODE(fl.trans_type_code,
                                            'SELF_RAISE_PRICE',
                                            'PARTY_A',
                                            'DELIVERED_PRICE',
                                            'PARTY_B',
                                            'NO',
                                            'NO') shipping_costs_bear,
                                     DECODE(fl.trans_type_code,
                                            'SELF_RAISE_PRICE',
                                            '自提价',
                                            'DELIVERED_PRICE',
                                            '到货价') shipping_costs_bear_desc,
                                     fl.counts_methods_code settlement_method,
                                     (SELECT c.description
                                        FROM csh_payment_terms_vl c
                                       WHERE c.payment_term_code =
                                             fl.counts_methods_code
                                         AND c.enabled_flag = 'Y'
                                         AND c.business_group =
                                             h.owner_business_group) settlement_method_desc,
                                     (SELECT c.payment_method_code
                                        FROM csh_payment_methods_vl c
                                       WHERE c.enabled_flag = 'Y'
                                         AND c.business_group =
                                             h.owner_business_group
                                         AND c.description =
                                             fl.payment_methods) payment_method,
                                     fl.payment_methods payment_method_desc
                                FROM pur_rfx_headers          h,
                                     pur_rfx_ln_items         l,
                                     fnd_companies_vl         f,
                                     fnd_business_units_vl    b,
                                     inv_organizations_vl     i,
                                     pur_rfx_feedback_headers fh,
                                     pur_rfx_feedback_lines   fl,
                                     sys_user                 u
                               WHERE h.rfx_header_id = l.rfx_header_id
                                 AND h.status = 'FINISHED'
                                 AND NVL(fl.create_con_flag, 'N') = 'N'
                                 AND b.business_unit_id =
                                     h.owner_business_unit_id
                                 AND l.inv_organization_id =
                                     i.inv_organization_id
                                 AND fh.rfx_header_id = h.rfx_header_id
                                 AND fh.feedback_header_id =
                                     fl.feedback_header_id
                                 AND fl.rfx_line_item_id =
                                     l.rfx_line_item_id
                                 AND fh.rfx_round = h.round
                                 AND fh.rfx_version = h.version
                                 AND fh.coop_company_id = f.company_id
                                 AND fl.suggested_flag = 'Y'
                                 AND h.created_by = u.user_id
                                 AND h.created_by = p_user_id
                                 AND h.owner_business_group =
                                     p_business_group
                                 and h.rfx_number = p_source_number
                                 and f.company_id = t_rfx_data.vendor_id) loop
        --如果已经创建了合同头则不用重复创建
        if v_con_head_id is null then
          --创建合同头
          create_cont_head(o_contract_header_id  => v_con_head_id,
                           o_contract_number     => v_contract_number,
                           p_vendor_id           => t_rfx_line_data.vendor_id,
                           p_business_unit_id    => t_rfx_line_data.business_unit_id,
                           p_company_id          => t_rfx_line_data.company_id,
                           p_inv_organization_id => t_rfx_line_data.inv_organization_id,
                           p_shipping_costs_bear => t_rfx_line_data.shipping_costs_bear,
                           p_settlement_method   => t_rfx_line_data.settlement_method,
                           p_payment_method      => t_rfx_line_data.payment_method,
                           p_is_manual           => 'N',
                           p_history_source_flag => 'N',
                           p_user_id             => p_user_id,
                           p_business_group      => p_business_group);
        end if;
        --创建合同行
        create_cont_line(p_contract_header_id  => v_con_head_id,
                         p_source_type         => t_rfx_line_data.source_type,
                         p_source_line_id      => t_rfx_line_data.source_line_id,
                         p_item_id             => t_rfx_line_data.item_id,
                         p_item_code           => t_rfx_line_data.item_code,
                         p_item_desc           => t_rfx_line_data.item_desc,
                         p_category_id         => t_rfx_line_data.category_id,
                         p_inv_organization_id => t_rfx_line_data.inv_organization_id,
                         p_quantity            => t_rfx_line_data.quantity,
                         p_uom_code            => t_rfx_line_data.uom_code,
                         p_tax_rate            => t_rfx_line_data.tax_rate,
                         p_tax_type_id         => t_rfx_line_data.tax_type_id,
                         p_price_tax           => t_rfx_line_data.price_tax,
                         p_plan_head_id        => t_rfx_line_data.plan_head_id,
                         p_pur_plan_number     => t_rfx_line_data.pur_plan_number,
                         p_plan_line_id        => t_rfx_line_data.plan_line_id,
                         p_plan_line_num       => t_rfx_line_data.plan_line_num,
                         p_user_id             => p_user_id);
      end loop;
      --由于会有多个供应商情况，所以这里返回的是拼接的合同号
      if o_con_head_id_list is null then
        o_con_head_id_list := v_con_head_id;
      else
        o_con_head_id_list := o_con_head_id_list || '/' || v_con_head_id;
      end if;
      if o_contract_number_list is null then
        o_contract_number_list := v_contract_number;
      else
        o_contract_number_list := o_contract_number_list || '/' ||
                                  v_contract_number;
      end if;
    end loop;
  end create_cont_for_all_rfx;
end jh_con_pkg;
/
