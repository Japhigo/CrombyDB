\qecho Creating table party_group_types

select rlm.register_component ( 'CIN', 'tab_party_group_types.sql' );

create table cin.party_group_types
  ( id                              serial                 primary key
  , code                            varchar(10)
  , display                         varchar(30)
  , description                     varchar(255)
  , available_flag                  char(1)                not null default 'N'
  , created_by                      varchar(30)            not null default session_user
  , created_date_time               timestamp              not null default current_timestamp
  , updated_by                      varchar(30)            not null default session_user
  , updated_date_time               timestamp              not null default current_timestamp
  , data_status_code                smallint               not null default 1
  );

select rlm.component_registered ( 'tab_party_group_types.sql' );
