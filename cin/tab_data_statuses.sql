\qecho Creating table data_statuses

select rlm.register_component('CIN', 'tab_data_statuses.sql');

create table cin.data_statuses
  (code                            smallint               not null primary key
  ,description                     varchar(255)           not null
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  );

select rlm.component_registered('PUB', 'tab_data_statuses.sql');
