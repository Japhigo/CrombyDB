\qecho Creating table tab_party_object_types

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

select rlm.component_registered('tab_party_object_types.sql');
