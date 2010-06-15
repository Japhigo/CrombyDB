\qecho Creating BUR trigger function for creating party organisation histories

select rlm.register_component ( 'CIN', 'fnc_trg_bur_party_organisations.sql' );

create or replace function cin.bur_party_organisations()
  returns trigger
as $bur_party_organisations$
  begin
    
    if new.data_status_code is null or
       new.data_status_code = old.data_status_code
    then
      if old.data_status_code = -1
      then
        new.data_status_code := 0;
    
      elsif old.data_status_code = 0
      then
        new.data_status_code := 3;

      elsif old.data_status_code = 1
      then
        new.data_status_code := 2;
      
      else
        new.data_status_code := old.data_status_code;
      end if;
    end if;

    if new.updated_date_time is null or
       new.updated_date_time = old.updated_date_time
    then
      new.updated_date_time := current_timestamp;
    end if;

    if new.updated_by is null
    then
      new.updated_by := session_user;
    end if;

    insert into cin.party_organisation_histories
      ( party_organisation_id
      , company_number
      , legal_classification_id
      , business_type_id
      , vat_registration_number
      ,	established_date
      , dissolved_date
      , tax_exempt_ind
      , created_by
      , created_date_time
      , updated_by
      , updated_date_time
      , data_status_code
      )
    values
      ( old.id
      , old.company_number
      , old.legal_classification_id
      , old.business_type_id
      , old.vat_registration_number
      ,	old.established_date
      , old.dissolved_date
      , old.tax_exempt_ind
      , old.created_by
      , old.created_date_time
      , old.updated_by
      , old.updated_date_time
      , old.data_status_code
      );

    return new;

  end;
$bur_party_organisations$ LANGUAGE plpgsql;

select rlm.component_registered ( 'fnc_trg_bur_party_organisations.sql' );
