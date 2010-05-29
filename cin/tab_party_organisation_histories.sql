\qecho Creating table party_organisation_histories

select rlm.register_component ( 'CIN', 'tab_party_organisation_histories.sql' );

create table cin.party_organisation_histories
  ( id                              serial                 primary key
  , party_organisation_id           int                    not null references cin.party_organisations ( id )
  , company_number                  varchar(30)
  , legal_classification_id         int                             references cin.legal_classifications ( id )
  , business_type_id                int                             references cin.business_types ( id )
  , vat_registration_number         varchar(30)
  ,	established_date                date
  , dissolved_date                  date
  , tax_exempt_ind                  char(1)
  , created_by                      varchar(30)
  , created_date_time               timestamp
  , updated_by                      varchar(30)
  , updated_date_time               timestamp
  , data_status_code                smallint
  );

select rlm.component_registered ( 'tab_party_organisation_histories.sql' );
