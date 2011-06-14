\qecho Creating table parties

select rlm.register_component('CIN', 'tab_parties.sql');

create table cin.parties
  (id                              serial                 primary key
  ,reference                       varchar(30)
  ,name                            varchar(255)
  ,party_object_type_code          varchar(3)             not null check(party_object_type_code in ('GRP', 'PER', 'ORG'))
  ,party_type_id                   int                             references cin.party_types(id)
  ,communication_language_id       int                             references cin.communication_languages(id)
  ,party_classification_id         int                             references cin.party_classifications(id)
  ,description                     varchar(255)
  ,internal                        boolean                not null
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,data_status_code                smallint               not null
  ,unique(reference)
  );

select rlm.component_registered('tab_parties.sql');
