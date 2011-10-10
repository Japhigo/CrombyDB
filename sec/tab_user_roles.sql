\qecho Creating table user_roles

select rlm.register_component('SEC', 'tab_user_roles.sql');

create table sec.user_roles
  (id                              serial                 primary key
  ,user_id                         int                    not null --references sec.users(id)
  ,system_role_id                  int                    not null --references sec.system_roles(id)
  ,user_role_start_date            date                   not null
  ,user_role_end_date              date
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,unique(user_id
         ,system_role_id
         )
  );

select rlm.component_registered('SEC', 'tab_user_roles.sql');
