-- create table
create table hn_source_scheme_checkbox
(
  checkbox_id                       number not null,
  scheme_number                     varchar2(100),
  reason_localization_flag          varchar2(100),
  reason_debunker_flag              varchar2(100),
  reason_capacity_exp_flag          varchar2(100),
  reason_lower_cost_flag            varchar2(100),
  reason_project_require_flag       varchar2(100),
  reason_supplier_library_flag      varchar2(100),
  reason_improve_quality_flag       varchar2(100),
  reason_strategic_dev_flag         varchar2(100),
  reason_insuff_supply_flag         varchar2(100),
  reason_others_flag                varchar2(100),
  method_internet_query_flag        varchar2(100),
  method_exhibition_flag            varchar2(100),
  method_dept_recommend_flag        varchar2(100),
  method_others_flag                varchar2(100),
  attribute1                 varchar2(100),
  attribute2                 varchar2(100),
  attribute3                 varchar2(100),
  attribute4                 varchar2(100),
  attribute5                 varchar2(100),
  attribute6                 varchar2(100),
  attribute7                 varchar2(100),
  attribute8                 varchar2(100),
  attribute9                 varchar2(100),
  attribute10                varchar2(100),
  created_by                 number,
  creation_date              date,
  last_updated_by            number,
  last_update_date           date
);
-- add comments to the table 
comment on table hn_source_scheme_checkbox
  is '寻源方案多选框表';
-- add comments to the columns 
comment on column hn_source_scheme_checkbox.checkbox_id
  is '主鍵';
comment on column hn_source_scheme_checkbox.scheme_number
  is '寻源方案编号';
comment on column hn_source_scheme_checkbox.reason_localization_flag
  is '国产化';
comment on column hn_source_scheme_checkbox.reason_debunker_flag
  is '去瓶颈';
comment on column hn_source_scheme_checkbox.reason_capacity_exp_flag
  is '扩产能';
comment on column hn_source_scheme_checkbox.reason_lower_cost_flag
  is '降成本';
comment on column hn_source_scheme_checkbox.reason_project_require_flag
  is '项目需求';
comment on column hn_source_scheme_checkbox.reason_supplier_library_flag
  is '供应商库优化';
comment on column hn_source_scheme_checkbox.reason_improve_quality_flag
  is '改进质量/服务';
comment on column hn_source_scheme_checkbox.reason_strategic_dev_flag
  is '战略发展因素';
comment on column hn_source_scheme_checkbox.reason_insuff_supply_flag
  is '供应资源不足';
comment on column hn_source_scheme_checkbox.reason_others_flag
  is '其他(请注明)';
comment on column hn_source_scheme_checkbox.method_internet_query_flag
  is '互联网查询';
comment on column hn_source_scheme_checkbox.method_exhibition_flag
  is '参加展会/展会资料';
comment on column hn_source_scheme_checkbox.method_dept_recommend_flag
  is '其他部门推荐';
comment on column hn_source_scheme_checkbox.method_others_flag
  is '其他(请注明)';        
-- create/recreate primary, unique and foreign key constraints 
alter table hn_source_scheme_checkbox
  add constraint hn_source_scheme_checkbox_pk primary key (checkbox_id);
alter table hn_source_scheme_checkbox
  add constraint hn_source_scheme_checkbox_u1 unique (scheme_number);

create sequence hn_source_scheme_checkbox_s;
