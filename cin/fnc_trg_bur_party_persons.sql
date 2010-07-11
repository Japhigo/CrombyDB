\qecho Creating BUR trigger function for creating party person histories

select rlm.register_component ( 'CIN', 'fnc_trg_bur_party_persons.sql' );

create or replace function cin.bur_party_persons()
  returns trigger
as $bur_party_persons$
  begin
    
    select cin.calc_data_status_code
      ( old.data_status_code
      , new.data_status_code
      )
      into new.data_status_code;

    if new.updated_by is null
    then
      new.updated_by := session_user;
    end if;

    new.updated_date_time := current_timestamp;

    insert into cin.party_person_histories
      ( party_person_id
      , given_name
      , middle_names
      , family_name
      , title
      , name_suffix
      , salutation
      , family_name_prefix
      , maiden_name
      , marital_status_id
      , gender_code
      , birth_date
      , death_date
      , nationality_id
      , children_count
      , employment_status_id
      , tax_identifier
      , birth_country_id
      , social_insurance_identifier
      , created_by
      , created_date_time
      , updated_by
      , updated_date_time
      , data_status_code
      )
    values
      ( old.id
      , old.given_name
      , old.middle_names
      , old.family_name
      , old.title
      , old.name_suffix
      , old.salutation
      , old.family_name_prefix
      , old.maiden_name
      , old.marital_status_id
      , old.gender_code
      , old.birth_date
      , old.death_date
      , old.nationality_id
      , old.children_count
      , old.employment_status_id
      , old.tax_identifier
      , old.birth_country_id
      , old.social_insurance_identifier
      , old.created_by
      , old.created_date_time
      , old.updated_by
      , old.updated_date_time
      , old.data_status_code
      );

    return new;

  end;
$bur_party_persons$ LANGUAGE plpgsql;

select rlm.component_registered ( 'fnc_trg_bur_party_persons.sql' );
