-- create table
create table hn_source_scheme_head
(
  head_id                   number not null,
  scheme_number             varchar2(100),
  scheme_status             varchar2(100),
  scheme_title              varchar2(1000),
  company_id                number,
  unit_id                   number,
  scheme_type_code          varchar2(100),
  production_line           varchar2(1000),
  category_id               number,
  item_id                   number,
  item_type_code            varchar2(100),
  source_reason_code        varchar2(100),
  vendor_reason_remark      varchar2(3000),
  source_background_info    varchar2(3000),
  source_quantity           number,
  vendor_type_code          varchar2(100),
  vendor_type_remark        varchar2(3000),
  potential_vendor_quantity number,
  potential_vendor_list     varchar2(3000),
  potential_vendor_source   varchar2(3000),
  potential_vendor_method   varchar2(100),
  vendor_method_remark      varchar2(3000),
  business_group            varchar2(100),
  attribute1                varchar2(100),
  attribute2                varchar2(100),
  attribute3                varchar2(100),
  attribute4                varchar2(100),
  attribute5                varchar2(100),
  attribute6                varchar2(100),
  attribute7                varchar2(100),
  attribute8                varchar2(100),
  attribute9                varchar2(100),
  attribute10               varchar2(100),
  created_by                number,
  creation_date             date,
  last_updated_by           number,
  last_update_date          date
);
-- add comments to the table 
comment on table hn_source_scheme_head
  is '寻源方案头表';
-- add comments to the columns 
comment on column hn_source_scheme_head.head_id
  is '头ID';
comment on column hn_source_scheme_head.scheme_number
  is '方案编号';
comment on column hn_source_scheme_head.scheme_status
  is '方案状态：HN_SCHEME_STATUS_SYSCODE';
comment on column hn_source_scheme_head.scheme_title
  is '方案标题';
comment on column hn_source_scheme_head.company_id
  is '公司ID';
comment on column hn_source_scheme_head.unit_id
  is '部门ID';
comment on column hn_source_scheme_head.scheme_type_code
  is '方案类型编码：HN_SCHEME_TYPE_SYSCODE';
comment on column hn_source_scheme_head.production_line
  is '生产线';
comment on column hn_source_scheme_head.category_id
  is '物料品类ID';
comment on column hn_source_scheme_head.item_id
  is '物料ID';
comment on column hn_source_scheme_head.item_type_code
  is '物料类型编码：HN_ITEM_TYPE_SYSCODE';
comment on column hn_source_scheme_head.source_reason_code
  is '寻源原因：HN_SOURCE_REASOM_SYSCODE';
comment on column hn_source_scheme_head.vendor_reason_remark
  is '寻源原因说明';
comment on column hn_source_scheme_head.source_background_info
  is '寻源背景说明';
comment on column hn_source_scheme_head.source_quantity
  is '寻源数量';
comment on column hn_source_scheme_head.vendor_type_code
  is '供应商类型编码：HN_VENDOR_TYPE_SYSCODE';
comment on column hn_source_scheme_head.vendor_type_remark
  is '寻源类型说明';  
comment on column hn_source_scheme_head.potential_vendor_quantity
  is '潜在供应商数量';
comment on column hn_source_scheme_head.potential_vendor_list
  is '潜在供应商列表';
comment on column hn_source_scheme_head.potential_vendor_source
  is '潜在供应商来源';
comment on column hn_source_scheme_head.potential_vendor_method
  is '潜在供应商寻找方式：HN_POTENTIAL_VENDOR_METHOD_SYSCODE';
comment on column hn_source_scheme_head.vendor_method_remark
  is '寻找方式说明';  
comment on column hn_source_scheme_head.business_group
  is '企业集团';
-- create/recreate primary, unique and foreign key constraints 
alter table hn_source_scheme_head
  add constraint hn_source_scheme_head_pk primary key (head_id);

--sequence
create sequence hn_source_scheme_head_s;
