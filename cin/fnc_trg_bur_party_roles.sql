\qecho Creating BUR trigger function for creating party role histories

select rlm.register_component ( 'CIN', 'fnc_trg_bur_party_roles.sql' );

create or replace function cin.bur_party_roles()
  returns trigger
as $bur_party_roles$
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

    insert into cin.party_role_histories
      ( party_role_id
      , party_id
      , party_role_type_id
      , description
      , start_date
      , end_date
      , created_by
      , created_date_time
      , updated_by
      , updated_date_time
      , data_status_code
      )
    values
      ( old.id
      , old.party_id
      , old.party_role_type_id
      , old.description
      , old.start_date
      , old.end_date
      , old.created_by
      , old.created_date_time
      , old.updated_by
      , old.updated_date_time
      , old.data_status_code
      );

    return new;

  end;
$bur_party_roles$ LANGUAGE plpgsql;

select rlm.component_registered ( 'fnc_trg_bur_party_roles.sql' );
