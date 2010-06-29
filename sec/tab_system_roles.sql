\qecho Creating table system_roles

select rlm.register_component ( 'SEC', 'tab_system_roles.sql' );

create table sec.system_roles
  ( id                              serial                 primary key
  , role_name                       varchar(30)
  , description                     varchar(255)
  , created_by                      varchar(30)            not null
  , created_date_time               timestamp              not null
  , updated_by                      varchar(30)            not null
  , updated_date_time               timestamp              not null
  );

select rlm.component_registered ( 'tab_system_roles.sql' );
