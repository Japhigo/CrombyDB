\qecho Creating table ref_data_loads

select rlm.register_component('CIN', 'tab_ref_data_loads.sql');

create table cin.ref_data_loads
  (id                              serial                   not null primary key
  ,ref_data_table_id               int                      not null references cin.ref_data_tables(id)
  ,description                     varchar(255)             not null
  ,file_details                    text                     not null
  ,data_load_file_type_code        cin.data_load_file_type  not null
  ,delimiter                       char(1)                  not null
  ,errors                          text
  ,created_by                      varchar(30)              not null
  ,created_at                      timestamp                not null
  ,updated_by                      varchar(30)              not null
  ,updated_at                      timestamp                not null
  ,data_load_status_code           smallint                 not null
  );

select rlm.component_registered('tab_ref_data_loads.sql');
