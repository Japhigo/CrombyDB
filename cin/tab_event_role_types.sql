\qecho Creating table event_role_types

select rlm.register_component ( 'CIN', 'tab_event_role_types.sql' );

create table cin.event_role_types
  ( id                              serial                 primary key
  , event_role_type                 varchar(30)            not null
  , description                     varchar(255)           not null
  , created_by                      varchar(30)            not null default session_user
  , created_date_time               timestamp              not null default current_timestamp
  , updated_by                      varchar(30)            not null default session_user
  , updated_date_time               timestamp              not null default current_timestamp
  , data_status_code                smallint               not null default 1
  , unique ( event_role_type )
  );

select rlm.component_registered ( 'tab_event_role_types.sql' );
