\qecho Creating table data_statuses

select rlm.register_component ( 'CIN', 'tab_data_statuses.sql' );

create table cin.data_statuses
  ( code                            int                    not null primary key
  , description                     varchar(255)           not null
  , created_by                      varchar(30)            not null default session_user
  , created_date_time               timestamp              not null default current_timestamp
  , updated_by                      varchar(30)            not null default session_user
  , updated_date_time               timestamp              not null default current_timestamp
  );

select rlm.component_registered ( 'tab_data_statuses.sql' );
