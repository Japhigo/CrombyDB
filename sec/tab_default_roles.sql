\qecho Creating table default_roles

select rlm.register_component('SEC', 'tab_default_roles.sql');

create table sec.default_roles
  (id                              serial                 primary key
  ,party_role_type_id              int                    not null references cin.party_role_types(id)
  ,system_roles_id                 int                    not null references sec.system_roles(id)
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  );

select rlm.component_registered('tab_default_roles.sql');
