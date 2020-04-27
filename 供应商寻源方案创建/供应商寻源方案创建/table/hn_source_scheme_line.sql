-- create table
create table hn_source_scheme_line
( line_id                   number not null,
  head_id                   number not null,
  line_num                  number,
  member_type_code          varchar2(100),
  member_user_id            number,
  team_leader_flag          varchar2(1),
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
comment on table hn_source_scheme_line
  is '寻源方案头表';
-- add comments to the columns 
comment on column hn_source_scheme_line.head_id
  is '头ID';
comment on column hn_source_scheme_line.line_id
  is '行ID';
comment on column hn_source_scheme_line.member_type_code
  is '成员类型：HN_MEMBER_TYPE_SYSCODE';
comment on column hn_source_scheme_line.member_user_id
  is '成员ID';
comment on column hn_source_scheme_line.team_leader_flag
  is '团队组长标记';
comment on column hn_source_scheme_line.line_num
  is '行号';

-- create/recreate primary, unique and foreign key constraints 
alter table hn_source_scheme_line
  add constraint hn_source_scheme_line_pk primary key (line_id);

--sequence
create sequence hn_source_scheme_line_s;
