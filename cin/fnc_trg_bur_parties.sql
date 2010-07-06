\qecho Creating BUR trigger function for creating party histories

select rlm.register_component ( 'CIN', 'fnc_trg_bur_parties.sql' );

create or replace function cin.bur_parties()
  returns trigger
as $bur_parties$
  begin
    
    select cin.calc_data_status_code
      ( old.data_status_code
      , new.data_status_code
      )
      into new.data_status_code;

    if new.updated_date_time is null or
       new.updated_date_time = old.updated_date_time
    then
      new.updated_date_time := current_timestamp;
    end if;

    if new.updated_by is null
    then
      new.updated_by := session_user;
    end if;

    insert into cin.party_histories
      ( party_id
      , reference
      , name
      , party_object_type_code
      , party_type_id
      , communication_language_id
      , party_classification_id
      , description
      , internal
      , created_by
      , created_date_time
      , updated_by
      , updated_date_time
      , data_status_code
      )
    values
      ( old.id
      , old.reference
      , old.name
      , old.party_object_type_code
      , old.party_type_id
      , old.communication_language_id
      , old.party_classification_id
      , old.description
      , old.internal
      , old.created_by
      , old.created_date_time
      , old.updated_by
      , old.updated_date_time
      , old.data_status_code
      );

    return new;

  end;
$bur_parties$ LANGUAGE plpgsql;

select rlm.component_registered ( 'fnc_trg_bur_parties.sql' );
