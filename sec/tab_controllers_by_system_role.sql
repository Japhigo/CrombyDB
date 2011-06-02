\qecho Creating table controllers

select rlm.register_component('SEC', 'tab_controllers_by_system_role.sql');

create table sec.controllers_by_system_role
  (id                              serial                 primary key
  ,controller_id                   int                    not null references sec.controllers(id)
  ,system_role_id                  int                    not null references sec.system_roles(id)
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  );

comment on table sec.controllers_by_system_role is 'Rails controllers linked to System Role.';
comment on column sec.controllers_by_system_role.id is 'Unique identifier for row.';
comment on column sec.controllers_by_system_role.controller_id is 'Foreign key to the Controllers table.';
comment on column sec.controllers_by_system_role.system_role_id is 'Foreign key to the System Roles table.';
comment on column sec.controllers_by_system_role.created_by is 'Username of the user who created the record.';
comment on column sec.controllers_by_system_role.created_at is 'Date and time created.';
comment on column sec.controllers_by_system_role.updated_by is 'Username of user who last updated the record.';
comment on column sec.controllers_by_system_role.updated_at is 'Date and time the record was last updated.';

select rlm.component_registered('tab_controllers_by_system_role.sql');