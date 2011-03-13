\qecho Creating table party_relationships

select rlm.register_component ('CIN', 'tab_party_relationships.sql');

create table cin.party_relationships
  (id                              serial                 primary key
  ,from_party_role_id              int                    not null references cin.party_roles(id)
  ,to_party_role_id                int                    not null references cin.party_roles(id)
  ,description                     varchar(255)           not null
  ,relationship_priority_id        int                    not null references cin.relationship_priorities(id)
  ,relationship_status_id          int                    not null references cin.relationship_statuses(id)
  ,start_date                      date                   not null
  ,end_date                        date
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,data_status_code                smallint               not null
  ,unique(from_party_role_id
         ,to_party_role_id
         ,start_date
         )
  );

select rlm.component_registered('tab_party_relationships.sql');
