\qecho Creating table employment_statuses

select rlm.register_component ( 'CIN', 'tab_employment_statuses.sql' );

create table cin.employment_statuses
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

select rlm.component_registered ( 'tab_employment_statuses.sql' );
