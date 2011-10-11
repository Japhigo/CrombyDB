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

comment on table sec.user_roles is '@DOCBOOK System Roles assigned to a user.';
comment on column sec.user_roles.id is '@DOCBOOK Unique identifier for row.';
comment on column sec.user_roles.user_id is '@DOCBOOK Foreign key to <link linkend="sec-table-users">USERS.</link>';
comment on column sec.user_roles.system_role_id is '@DOCBOOK Foreign key to <link linkend="sec-table-system_roles">SYSTEM_ROLES.</link>';
comment on column sec.user_roles.user_role_start_date is '@DOCBOOK Date from which a system role is available to a user.';
comment on column sec.user_roles.user_role_end_date is '@DOCBOOK Date after which a system role is no longer available to a user.';
comment on column sec.user_roles.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column sec.user_roles.created_at is '@DOCBOOK Date and time the record was created.';
comment on column sec.user_roles.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column sec.user_roles.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('SEC', 'tab_user_roles.sql');
