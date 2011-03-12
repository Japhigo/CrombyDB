\qecho Creating table data_load_statuses

select rlm.register_component('CIN', 'tab_data_load_statuses.sql');

create table cin.data_load_statuses
  (code                            smallint               not null primary key
  ,description                     varchar(255)           not null
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  );

select rlm.component_registered('tab_data_load_statuses.sql');
