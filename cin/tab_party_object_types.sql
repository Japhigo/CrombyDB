\qecho Creating table party_object_types

select rlm.register_component('CIN', 'tab_party_object_types.sql');

create table cin.party_object_types
  (id                              serial                 primary key
  ,party_object_type_code          varchar(3)             not null check(party_object_type_code in ('GRP', 'PER', 'ORG'))
  ,internal                        boolean                not null
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,unique (party_object_type_code
          ,internal
          )
  );

comment on table cin.party_object_types is '@DOCBOOK Cromby system table to control types of Party and Party Role.';
comment on column cin.party_object_types.id is '@DOCBOOK Unique identifier for row.';
comment on column cin.party_object_types.party_object_type_code is '@DOCBOOK One of GRP for Group, PER for Person, or ORG for Organisation.';
comment on column cin.party_object_types.internal is '@DOCBOOK Indicates whether the child Party/Party Role is internal to your organisation or external e.g. a customer.';
comment on column cin.party_object_types.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column cin.party_object_types.created_at is '@DOCBOOK Date and time the record was created.';
comment on column cin.party_object_types.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column cin.party_object_types.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('CIN', 'tab_party_object_types.sql');
