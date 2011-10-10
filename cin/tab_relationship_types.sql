\qecho Creating table relationship_types

select rlm.register_component('CIN', 'tab_relationship_types.sql');

create table cin.relationship_types
  (id                              serial                 primary key
  ,from_party_role_type_id         int                    not null references cin.party_role_types(id)
  ,to_party_role_type_id           int                    not null references cin.party_role_types(id)
  ,code                            varchar(10)
  ,display                         varchar(30)            not null
  ,description                     varchar(255)
  ,effective_from_date             date                   not null
  ,effective_to_date               date
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,data_status_code                smallint               not null
  ,unique(from_party_role_type_id
         ,to_party_role_type_id
         )
  );

select rlm.component_registered('tab_relationship_types.sql');
