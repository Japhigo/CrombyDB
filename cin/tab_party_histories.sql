\qecho Creating table party_histories

select rlm.register_component('CIN', 'tab_party_histories.sql');

create table cin.party_histories
  (id                              serial                 primary key
  ,party_id                        int                    references cin.parties(id)
  ,reference                       varchar(30)
  ,name                            varchar(255)
  ,party_object_type_code          cin.party_object_type
  ,party_type_id                   int
  ,communication_language_id       int
  ,party_classification_id         int
  ,description                     varchar(255)
  ,internal                        boolean
  ,created_by                      varchar(30)
  ,created_at                      timestamp
  ,updated_by                      varchar(30)
  ,updated_at                      timestamp
  ,data_status_code                smallint
  );

select rlm.component_registered('tab_party_histories.sql');
