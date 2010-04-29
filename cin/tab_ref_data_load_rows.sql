\qecho Creating table ref_data_load_rows

select rlm.register_component ( 'CIN', 'tab_ref_data_load_rows.sql' );

create table cin.ref_data_load_rows
  ( id                              serial                 not null primary key
  , ref_data_load_id                int                    not null references cin.ref_data_loads ( id )
  , raw_data_row                    text
  , errors                          text
  , created_by                      varchar(30)            not null
  , created_date_time               timestamp              not null
  , updated_by                      varchar(30)            not null
  , updated_date_time               timestamp              not null
  , data_load_status_code           smallint               not null
  );

select rlm.component_registered ( 'tab_ref_data_load_rows.sql' );
