\qecho Creating table business_types

select rlm.register_component ( 'CIN', 'tab_business_types.sql' );

create table cin.business_types
  ( id                              serial                 primary key
  , business_type_code              varchar(15)            not null
  , description                     varchar(255)           not null
  , created_by                      varchar(30)            not null default session_user
  , created_date_time               timestamp              not null default current_timestamp
  , updated_by                      varchar(30)            not null default session_user
  , updated_date_time               timestamp              not null default current_timestamp
  , data_status_code                smallint               not null default 1
  , unique ( business_type_code )
  );

select rlm.component_registered ( 'tab_business_types.sql' );
