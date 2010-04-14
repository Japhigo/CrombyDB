\qecho Creating table ref_data_load_rows

select rlm.register_component ( 'CIN', 'tab_ref_data_load_rows.sql' );

create table cin.ref_data_load_rows
  ( id                              serial                 not null primary key
  , ref_data_load_id                int                    not null references cin.ref_data_loads ( id )
  , code                            varchar(10)
  , display                         varchar(30)
  , description                     varchar(255)
  );

select rlm.component_registered ( 'tab_ref_data_load_rows.sql' );
