\qecho Creating table user_roles

select rlm.register_component ( 'SEC', 'tab_user_roles.sql' );

create table sec.user_roles
  ( id                              serial                 primary key
  , user_id                         int                    not null references sec.users ( id )
  , system_roles_id                 int                    not null references sec.system_roles ( id )
  , user_role_start_date            date                   not null
  , user_role_end_date              date
  , created_by                      varchar(30)            not null
  , created_date_time               timestamp              not null
  , updated_by                      varchar(30)            not null
  , updated_date_time               timestamp              not null
  );

select rlm.component_registered ( 'tab_user_roles.sql' );
