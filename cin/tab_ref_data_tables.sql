\qecho Creating table ref_data_tables

select rlm.register_component ( 'CIN', 'tab_ref_data_tables.sql' );

create table cin.ref_data_tables
  ( id                              serial                 not null primary key
  , table_name                      varchar(63)            not null
  , description                     varchar(255)           not null
  , code_mandatory                  boolean                not null default false
  , code_min_length                 smallint               not null default 0
  , code_max_length                 smallint               not null default 0
  , code_format                     varchar(255)
  , display_mandatory               boolean                not null default false
  , description_mandatory           boolean                not null default false
  , created_by                      varchar(30)            not null default session_user
  , created_date_time               timestamp              not null default current_timestamp
  , updated_by                      varchar(30)            not null default session_user
  , updated_date_time               timestamp              not null default current_timestamp
  );

select rlm.component_registered ( 'tab_ref_data_tables.sql' );
