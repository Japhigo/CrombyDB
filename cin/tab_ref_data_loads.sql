\qecho Creating table ref_data_loads

select rlm.register_component ( 'CIN', 'tab_ref_data_loads.sql' );

create table cin.ref_data_loads
  ( id                              serial                 not null primary key
  , ref_data_table_id               int                    not null references cin.ref_data_tables ( id )
  , description                     varchar(255)           not null
  , file_details                    varchar(255)           not null
  , delimiter                       char(1)                not null default ','
  , data_load_status_code           smallint               not null default 1
  , loaded_by                       varchar(30)            not null default session_user
  , loaded_date_time                timestamp              not null default current_timestamp
  , validated_by                    varchar(30)
  , validated_date_time             timestamp
  , implemented_by                  varchar(30)
  , implemented_date_time           timestamp
  );

select rlm.component_registered ( 'tab_ref_data_loads.sql' );
