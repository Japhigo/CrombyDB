\qecho Creating table party_role_types

select rlm.register_component('CIN', 'tab_party_role_types.sql');

create table cin.party_role_types
  (id                              int                    primary key
  ,display                         varchar(30)            not null    check(length(display) > 0)
  ,description                     varchar(255)
  ,party_object_type_id            int                    not null --references cin.party_object_types(id)
  ,effective_from_date             date                   not null    check(effective_from_date >= current_date)
  ,effective_to_date               date
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,data_status_code                smallint               not null
  );

comment on table cin.party_role_types is '@DOCBOOK Types used to classify Party Roles.';
comment on column cin.party_role_types.id is '@DOCBOOK Unique identifier for row.';
comment on column cin.party_role_types.display is '@DOCBOOK Display name of Party Role Types for use on screens, lists etc.';
comment on column cin.party_role_types.description is '@DOCBOOK Optional description of the Party Role Type''s purpose.';
comment on column cin.party_role_types.party_object_type_id is '@DOCBOOK Foreign key to <link linkend="party_role_types">PARTY_ROLE_TYPES.</link>';
comment on column cin.party_role_types.effective_from_date is '@DOCBOOK Date from which a Party Role Type is available.';
comment on column cin.party_role_types.effective_to_date is '@DOCBOOK Date after which a system Party Role Type is no longer available.';
comment on column cin.party_role_types.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column cin.party_role_types.created_at is '@DOCBOOK Date and time the record was created.';
comment on column cin.party_role_types.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column cin.party_role_types.updated_at is '@DOCBOOK Date and time the record was last updated.';
comment on column cin.party_role_types.data_status_code is '@DOCBOOK Code used to track the lifecycle of a record.';
select rlm.component_registered('CIN', 'tab_party_role_types.sql');
