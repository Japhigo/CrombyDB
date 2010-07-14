\qecho Creating table telephone_connection_types

select rlm.register_component ( 'CIN', 'tab_telephone_connection_types.sql' );

create table cin.telephone_connection_types
  ( id                              serial                 primary key
  , code                            varchar(10)
  , display                         varchar(30)            not null
  , description                     varchar(255)
  , available                       boolean                not null
  , created_by                      varchar(30)            not null
  , created_date_time               timestamp              not null
  , updated_by                      varchar(30)            not null
  , updated_date_time               timestamp              not null
  , data_status_code                smallint               not null
  );

select rlm.component_registered ( 'tab_telephone_connection_types.sql' );
