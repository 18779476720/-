CREATE OR REPLACE VIEW HN_SOURCE_SCHEME_HEAD_VL AS
select h.head_id,
       h.scheme_number,
       h.scheme_status,
       (SELECT s.code_value_name
          FROM sys_code_values_v s
         WHERE s.code = 'HN_SCHEME_STATUS_SYSCODE'
           AND s.code_value = h.scheme_status
           AND s.code_enabled_flag = 'Y'
           AND s.code_value_enabled_flag = 'Y') scheme_status_desc,
       h.scheme_title,
       h.company_id,
       c.company_code,
       c.company_full_name company_name,
       h.unit_id,
       u.unit_code,
       u.unit_desc,
       h.scheme_type_code,
       (SELECT s.code_value_name
          FROM sys_code_values_v s
         WHERE s.code = 'HN_SCHEME_TYPE_SYSCODE'
           AND s.code_value = h.scheme_type_code
           AND s.code_enabled_flag = 'Y'
           AND s.code_value_enabled_flag = 'Y') scheme_type_desc,
       h.production_line,
       h.category_id,
       mc.category_code,
       mc.category_name,
       h.item_id,
       m.display_item_code item_code,
       m.item_name,
       h.item_type_code,
       (SELECT s.code_value_name
          FROM sys_code_values_v s
         WHERE s.code = 'HN_ITEM_TYPE_SYSCODE'
           AND s.code_value = h.item_type_code
           AND s.code_enabled_flag = 'Y'
           AND s.code_value_enabled_flag = 'Y') item_type_desc,
       h.source_reason_code,
       (SELECT s.code_value_name
          FROM sys_code_values_v s
         WHERE s.code = 'HN_SOURCE_REASOM_SYSCODE'
           AND s.code_value = h.source_reason_code
           AND s.code_enabled_flag = 'Y'
           AND s.code_value_enabled_flag = 'Y') source_reason_desc,
       h.vendor_reason_remark,
       h.source_background_info,
       h.source_quantity,
       h.vendor_type_code,
       (SELECT s.code_value_name
          FROM sys_code_values_v s
         WHERE s.code = 'HN_VENDOR_TYPE_SYSCODE'
           AND s.code_value = h.vendor_type_code
           AND s.code_enabled_flag = 'Y'
           AND s.code_value_enabled_flag = 'Y') vendor_type_desc,
       h.vendor_type_remark,
       h.potential_vendor_quantity,
       h.potential_vendor_list,
       h.potential_vendor_source,
       h.potential_vendor_method,
       (SELECT s.code_value_name
          FROM sys_code_values_v s
         WHERE s.code = 'HN_POTENTIAL_VENDOR_METHOD_SYSCODE'
           AND s.code_value = h.potential_vendor_method
           AND s.code_enabled_flag = 'Y'
           AND s.code_value_enabled_flag = 'Y') potential_vendor_method_desc,
       h.vendor_method_remark,
       h.business_group,
       h.attribute1,
       h.attribute2,
       h.attribute3,
       h.attribute4,
       h.attribute5,
       h.attribute6,
       h.attribute7,
       h.attribute8,
       h.attribute9,
       h.attribute10,
       h.created_by,
       u.description create_by_desc,
       h.creation_date,
       to_char(h.creation_date, 'yyyy-mm-dd') create_date_desc,
       nvl(b.reason_localization_flag, 'N') reason_localization_flag,
       nvl(b.reason_debunker_flag, 'N') reason_debunker_flag,
       nvl(b.reason_capacity_exp_flag, 'N') reason_capacity_exp_flag,
       nvl(b.reason_lower_cost_flag, 'N') reason_lower_cost_flag,
       nvl(b.reason_project_require_flag, 'N') reason_project_require_flag,
       nvl(b.reason_supplier_library_flag, 'N') reason_supplier_library_flag,
       nvl(b.reason_improve_quality_flag, 'N') reason_improve_quality_flag,
       nvl(b.reason_strategic_dev_flag, 'N') reason_strategic_dev_flag,
       nvl(b.reason_insuff_supply_flag, 'N') reason_insuff_supply_flag,
       nvl(b.reason_others_flag, 'N') reason_others_flag,
       nvl(b.method_internet_query_flag, 'N') method_internet_query_flag,
       nvl(b.method_exhibition_flag, 'N') method_exhibition_flag,
       nvl(b.method_dept_recommend_flag, 'N') method_dept_recommend_flag,
       nvl(b.method_others_flag, 'N') method_others_flag
  from hn_source_scheme_head          h,
       sys_user                       u,
       fnd_companies_vl               c,
       hrm_units_vl                   u,
       mtl_categories_user_defined_vl mc,
       mtl_system_items_vl            m,
       hn_source_scheme_checkbox      b
 where h.created_by = u.user_id
   and h.company_id = c.company_id
   and h.unit_id = u.unit_id
   and h.category_id = mc.category_udf_id
   and h.item_id = m.item_id
   and h.scheme_number=b.scheme_number(+);
