\qecho Creating BIR trigger function for setting data_statuses and audit

select rlm.register_component ( 'CIN', 'fnc_trg_bir_data_statuses.sql' );

create or replace function cin.bir_data_statuses()
  returns trigger
as $bir_data_statuses$
  begin
    
    if new.available is null
    then
      new.available := false;
    end if;

    if new.data_status_code is null
    then
      new.data_status_code := 1;
    end if;

    if new.created_by is null
    then
      new.created_by := session_user;
    end if;

    if new.updated_by is null
    then
      new.updated_by := session_user;
    end if;

    new.created_date_time := current_timestamp;
    new.updated_date_time := current_timestamp;

    return new;

  end;
$bir_data_statuses$ LANGUAGE plpgsql;

select rlm.component_registered ( 'fnc_trg_bir_data_statuses.sql' );
