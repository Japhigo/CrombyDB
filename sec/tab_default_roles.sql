\qecho Creating table default_roles

select rlm.register_component('SEC', 'tab_default_roles.sql');

create table sec.default_roles
  (id                              serial                 primary key
  ,party_role_type_id              int                    not null --references cin.party_role_types(id)
  ,system_role_id                  int                    not null --references sec.system_roles(id)
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,unique(party_role_type_id
         ,system_role_id
         )
  );

comment on table sec.default_roles is '@DOCBOOK Default system roles to be assigned to user based on their party roles.';
comment on column sec.default_roles.id is '@DOCBOOK Unique identifier for row.';
comment on column sec.default_roles.party_role_type_id is '@DOCBOOK Foreign key to <link linkend="cin-table-party_role_types">CIN.PARTY_ROLE_TYPES.</link>';
comment on column sec.default_roles.system_role_id is '@DOCBOOK Foreign key to <link linkend="sec-table-system_roles">SEC.SYSTEM_ROLES.</link>';
comment on column sec.default_roles.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column sec.default_roles.created_at is '@DOCBOOK Date and time the record was created.';
comment on column sec.default_roles.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column sec.default_roles.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('SEC', 'tab_default_roles.sql');
