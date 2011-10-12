\qecho Creating table controllers_by_system_role

select rlm.register_component('SEC', 'tab_controllers_by_system_role.sql');

create table sec.controllers_by_system_role
  (id                              serial                 primary key
  ,controller_id                   int                    not null --references sec.controllers(id)
  ,system_role_id                  int                    not null --references sec.system_roles(id)
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,unique(controller_id
         ,system_role_id)
  );

comment on table sec.controllers_by_system_role is '@DOCBOOK Rails controllers available to a System Role.';
comment on column sec.controllers_by_system_role.id is '@DOCBOOK Unique identifier for row.';
comment on column sec.controllers_by_system_role.controller_id is '@DOCBOOK Foreign key to <link linkend="sec-table-controllers">CONTROLLERS.</link>';
comment on column sec.controllers_by_system_role.system_role_id is '@DOCBOOK Foreign key to <link linkend="sec-table-system_roles">SYSTEM_ROLES.</link>';
comment on column sec.controllers_by_system_role.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column sec.controllers_by_system_role.created_at is '@DOCBOOK Date and time the record was created.';
comment on column sec.controllers_by_system_role.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column sec.controllers_by_system_role.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('SEC', 'tab_controllers_by_system_role.sql');
