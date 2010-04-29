\qecho Creating table relationship_priorities

select rlm.register_component ( 'CIN', 'tab_relationship_priorities.sql' );

create table cin.relationship_priorities
  ( id                              serial                 primary key
  , code                            varchar(10)
  , display                         varchar(30)            not null
  , description                     varchar(255)
  , available                       boolean                not null
  , created_by                      varchar(30)            not null
  , created_date_time               timestamp              not null
  , updated_by                      varchar(30)            not null
  , updated_date_time               timestamp              not null
  , data_status_code                smallint               not null
  );

select rlm.component_registered ( 'tab_relationship_priorities.sql' );
