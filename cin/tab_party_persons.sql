\qecho Creating table party_persons

select rlm.register_component('CIN', 'tab_party_persons.sql');

create table cin.party_persons
  (id                              serial                 primary key
  ,party_id                        int                    not null references cin.parties(id)
  ,given_name                      varchar(40)
  ,middle_names                    varchar(40)
  ,family_name                     varchar(40)
  ,title                           varchar(40)
  ,name_suffix                     varchar(40)
  ,salutation                      varchar(40)
  ,family_name_prefix              varchar(40)
  ,maiden_name                     varchar(40)
  ,marital_status_id               int                             references cin.marital_statuses(id)
  ,gender_code                     smallint                        references cin.genders(id)
  ,birth_date                      date
  ,death_date                      date
  ,nationality_id                  int                             references cin.countries(id)
  ,children_count                  smallint
  ,employment_status_id            int                             references cin.employment_statuses(id)
  ,tax_identifier                  varchar(40)
  ,birth_country_id                int                             references cin.countries(id)
  ,social_insurance_identifier     varchar(40)
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,data_status_code                smallint               not null
  ,unique(party_id)
  );

select rlm.component_registered ('CIN', 'tab_party_persons.sql');
