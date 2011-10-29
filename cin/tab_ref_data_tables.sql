\qecho Creating table ref_data_tables

select rlm.register_component('CIN', 'tab_ref_data_tables.sql');

create table cin.ref_data_tables
  (id                              serial                 not null primary key
  ,table_name                      varchar(63)            not null check(length(table_name) > 0)
  ,description                     varchar(255)           not null check(length(description) > 0)
  ,code_mandatory                  boolean                not null
  ,code_min_length                 smallint                        check(code_min_length >= 0 and code_min_length <= 10)
  ,code_max_length                 smallint                        check(code_max_length >= 0 and code_max_length <= 10)
  ,code_format                     varchar(255)
  ,description_mandatory           boolean                not null
  ,created_by                      varchar(30)            not null check(length(created_by) > 0)
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null check(length(updated_by) > 0)
  ,updated_at                      timestamp              not null
  ,check(code_min_length <= code_max_length)
  );

comment on table cin.ref_data_tables is '@DOCBOOK Reference Data Table information and validation rules.';
comment on column cin.ref_data_tables.id is '@DOCBOOK Unique identifier for row.';
comment on column cin.ref_data_tables.table_name is '@DOCBOOK Reference Data Table.';
comment on column cin.ref_data_tables.description is '@DOCBOOK Description of contents.';
comment on column cin.ref_data_tables.code_mandatory is '@DOCBOOK Indicates if a code must be supplied.';
comment on column cin.ref_data_tables.code_min_length is '@DOCBOOK Minimum length of code, must be between 0 and 10.';
comment on column cin.ref_data_tables.code_max_length is '@DOCBOOK Maximum length of code, must be between 0 and 10.';
comment on column cin.ref_data_tables.code_format is '@DOCBOOK Regular expression to validate format of code.';
comment on column cin.ref_data_tables.description_mandatory is '@DOCBOOK Indicates if a description must be supplied.';
comment on column cin.ref_data_tables.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column cin.ref_data_tables.created_at is '@DOCBOOK Date and time the record was created.';
comment on column cin.ref_data_tables.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column cin.ref_data_tables.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('CIN', 'tab_ref_data_tables.sql');
