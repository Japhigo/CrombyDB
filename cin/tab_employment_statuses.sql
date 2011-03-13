\qecho Creating table employment_statuses

select rlm.register_component('CIN', 'tab_employment_statuses.sql');

create table cin.employment_statuses
  (id                              serial                 primary key
  ,code                            varchar(10)
  ,display                         varchar(30)            not null
  ,description                     varchar(255)
  ,effective_from_date             date                   not null
  ,effective_to_date               date
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,data_status_code                smallint               not null
  );

select rlm.component_registered('tab_employment_statuses.sql');
