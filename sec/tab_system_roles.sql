\qecho Creating table system_roles

select rlm.register_component('SEC', 'tab_system_roles.sql');

create table sec.system_roles
  (id                              serial                 primary key
  ,role_name                       varchar(30)            not null check(length(role_name) > 0)
  ,description                     varchar(255)           not null check(length(description) > 0)
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,unique(upper(role_name))
  );

comment on table sec.system_roles is '@DOCBOOK System roles grouping available functionality.';
comment on column sec.system_roles.id is '@DOCBOOK Unique identifier for row.';
comment on column sec.system_roles.role_name is '@DOCBOOK Unique system role name';
comment on column sec.system_roles.description is '@DOCBOOK Description of the system role''s function.';
comment on column sec.system_roles.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column sec.system_roles.created_at is '@DOCBOOK Date and time the record was created.';
comment on column sec.system_roles.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column sec.system_roles.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('SEC', 'tab_system_roles.sql');
