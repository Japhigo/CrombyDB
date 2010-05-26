\qecho Creating table party_person_histories

select rlm.register_component ( 'CIN', 'tab_party_person_histories.sql' );

create table cin.party_person_histories
  ( id                              serial                 primary key
  , party_person_id                 int                    references party_persons ( id )
  , given_name                      varchar(40)
  , middle_names                    varchar(40)
  , family_name                     varchar(40)
  , title                           varchar(40)
  , name_suffix                     varchar(40)
  , salutation                      varchar(40)
  , family_name_prefix              varchar(40)
  , maiden_name                     varchar(40)
  , marital_status_id               int
  , gender_code                     smallint
  , birth_date                      date
  , death_date                      date
  , nationality                     int
  , children_count                  smallint
  , employment_status_id            int
  , tax_identifier                  varchar(40)
  , birth_country_id                int
  , social_insurance_identifier     varchar(40)
  , created_by                      varchar(30)
  , created_date_time               timestamp
  , updated_by                      varchar(30)
  , updated_date_time               timestamp
  , data_status_code                smallint
  );

select rlm.component_registered ( 'tab_party_person_histories.sql' );
