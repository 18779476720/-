-- create table
create table hn_operation_records
(
  record_id          number not null,
  user_id            number,
  user_name          varchar2(240),
  status             varchar2(30),
  status_desc        varchar2(100),
  operation_desc     varchar2(2000),
  operation_table    varchar2(30),
  operation_table_id number,
  created_by         number,
  creation_date      date,
  last_updated_by    number,
  last_update_date   date
);
-- add comments to the table 
comment on table hn_operation_records
  is '²Ù×÷¼ÇÂ¼';
-- create/recreate indexes 
create index hn_operation_records_n1 on hn_operation_records (operation_table, operation_table_id);
-- create/recreate primary, unique and foreign key constraints 
alter table hn_operation_records
  add primary key (record_id);
--sequence
create sequence hn_operation_records_s;
