\qecho Creating table db_release_components

create table rlm.db_release_components
  ( id                   serial              primary key
  , db_release_id        int                 not null     references rlm.db_releases ( id )
  , component_type_code  rlm.component_type
  , component_name       varchar(255)        not null
  , installed_by         varchar(30)         not null
  , start_date_time      timestamp           not null     default current_timestamp
  , end_date_time        timestamp
  );
