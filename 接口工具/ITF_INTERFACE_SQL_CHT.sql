﻿CREATE TABLE "ITF_INTERFACE_SQL_CHT" 
   (  "PK_ID" NUMBER, 
  "TABLE_NAME" VARCHAR2(30), 
  "EITF_TABLE_TEXT" CLOB, 
  "ITF_TABLE_TEXT" CLOB, 
  "ITF_TABLE_HEAD_TEXT" CLOB, 
  "TABLE_ES" CLOB, 
  "SRM_TEXT" CLOB, 
  "ITF_TEXT" CLOB, 
  "CREATION_DATE" DATE, 
  "CREATED_BY" NUMBER, 
  "LAST_UPDATE_DATE" DATE, 
  "LAST_UPDATED_BY" NUMBER
   );
   
   create sequence itf_interface_sql_cht_s
