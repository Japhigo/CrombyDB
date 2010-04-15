\qecho Creating table communication_languages

select rlm.register_component ( 'CIN', 'tab_communication_languages.sql' );

create table cin.communication_languages
  ( id                              serial                 primary key
  , code                            varchar(10)
  , display                         varchar(30)
  , description                     varchar(255)
  , available                       boolean                not null default false
  , created_by                      varchar(30)            not null default session_user
  , created_date_time               timestamp              not null default current_timestamp
  , updated_by                      varchar(30)            not null default session_user
  , updated_date_time               timestamp              not null default current_timestamp
  , data_status_code                smallint               not null default 1
  );

select rlm.component_registered ( 'tab_communication_languages.sql' );


