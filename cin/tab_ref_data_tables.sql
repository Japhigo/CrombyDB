\qecho Creating table ref_data_tables

select rlm.register_component ( 'CIN', 'tab_ref_data_tables.sql' );

create table cin.ref_data_tables
  ( id                              serial                 not null primary key
  , table_name                      varchar(63)            not null
  , description                     varchar(255)           not null
  , code_mandatory                  boolean                not null
  , code_min_length                 smallint
  , code_max_length                 smallint
  , code_format                     varchar(255)
  , description_mandatory           boolean                not null
  , created_by                      varchar(30)            not null
  , created_date_time               timestamp              not null
  , updated_by                      varchar(30)            not null
  , updated_date_time               timestamp              not null
  );

select rlm.component_registered ( 'tab_ref_data_tables.sql' );
