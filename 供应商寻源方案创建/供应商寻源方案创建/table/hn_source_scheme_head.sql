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
  is 'ѰԴ����ͷ��';
-- add comments to the columns 
comment on column hn_source_scheme_head.head_id
  is 'ͷID';
comment on column hn_source_scheme_head.scheme_number
  is '�������';
comment on column hn_source_scheme_head.scheme_status
  is '����״̬��HN_SCHEME_STATUS_SYSCODE';
comment on column hn_source_scheme_head.scheme_title
  is '��������';
comment on column hn_source_scheme_head.company_id
  is '��˾ID';
comment on column hn_source_scheme_head.unit_id
  is '����ID';
comment on column hn_source_scheme_head.scheme_type_code
  is '�������ͱ��룺HN_SCHEME_TYPE_SYSCODE';
comment on column hn_source_scheme_head.production_line
  is '������';
comment on column hn_source_scheme_head.category_id
  is '����Ʒ��ID';
comment on column hn_source_scheme_head.item_id
  is '����ID';
comment on column hn_source_scheme_head.item_type_code
  is '�������ͱ��룺HN_ITEM_TYPE_SYSCODE';
comment on column hn_source_scheme_head.source_reason_code
  is 'ѰԴԭ��HN_SOURCE_REASOM_SYSCODE';
comment on column hn_source_scheme_head.vendor_reason_remark
  is 'ѰԴԭ��˵��';
comment on column hn_source_scheme_head.source_background_info
  is 'ѰԴ����˵��';
comment on column hn_source_scheme_head.source_quantity
  is 'ѰԴ����';
comment on column hn_source_scheme_head.vendor_type_code
  is '��Ӧ�����ͱ��룺HN_VENDOR_TYPE_SYSCODE';
comment on column hn_source_scheme_head.vendor_type_remark
  is 'ѰԴ����˵��';  
comment on column hn_source_scheme_head.potential_vendor_quantity
  is 'Ǳ�ڹ�Ӧ������';
comment on column hn_source_scheme_head.potential_vendor_list
  is 'Ǳ�ڹ�Ӧ���б�';
comment on column hn_source_scheme_head.potential_vendor_source
  is 'Ǳ�ڹ�Ӧ����Դ';
comment on column hn_source_scheme_head.potential_vendor_method
  is 'Ǳ�ڹ�Ӧ��Ѱ�ҷ�ʽ��HN_POTENTIAL_VENDOR_METHOD_SYSCODE';
comment on column hn_source_scheme_head.vendor_method_remark
  is 'Ѱ�ҷ�ʽ˵��';  
comment on column hn_source_scheme_head.business_group
  is '��ҵ����';
-- create/recreate primary, unique and foreign key constraints 
alter table hn_source_scheme_head
  add constraint hn_source_scheme_head_pk primary key (head_id);

--sequence
create sequence hn_source_scheme_head_s;
