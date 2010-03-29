\qecho Creating table marital_statuses

select rlm.register_component ( 'CIN', 'tab_marital_statuses.sql' );

create table cin.marital_statuses
  ( id                              serial                 primary key
  , marital_status                  varchar(30)            not null
  , description                     varchar(255)           not null
  , created_by                      varchar(30)            not null default session_user
  , created_date_time               timestamp              not null default current_timestamp
  , updated_by                      varchar(30)            not null default session_user
  , updated_date_time               timestamp              not null default current_timestamp
  , data_status_code                smallint               not null default 1
  );

select rlm.component_registered ( 'tab_marital_statuses.sql' );
