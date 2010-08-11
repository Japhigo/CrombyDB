\qecho Creating table db_releases

create table rlm.db_releases
  ( id                 serial            primary key
  , release_type_code  rlm.release_type  not null
  , major_id           smallint          not null
  , minor_id           smallint          not null
  , sub_id             smallint          not null
  , description        varchar(255)      not null
  , release_notes      text              not null
  , installed_by       varchar(30)       not null
  , start_date_time    timestamp         not null  default current_timestamp
  , end_date_time      timestamp
  , unique ( release_type_code
           , major_id
           , minor_id
           , sub_id
           )
  );
