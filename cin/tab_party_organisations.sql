\qecho Creating table party_organisations

select rlm.register_component('CIN', 'tab_party_organisations.sql');

create table cin.party_organisations
  (id                              serial                 primary key
  ,party_id                        int                    not null references cin.parties(id)
  ,company_number                  varchar(30)
  ,legal_classification_id         int                             references cin.legal_classifications(id)
  ,business_type_id                int                             references cin.business_types(id)
  ,vat_registration_number         varchar(30)
  ,established_date                date
  ,dissolved_date                  date
  ,tax_exempt_ind                  char(1)
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,data_status_code                smallint               not null
  ,unique(party_id)
  );

select rlm.component_registered('tab_party_organisations.sql');
