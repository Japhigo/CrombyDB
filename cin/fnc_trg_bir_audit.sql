\qecho Creating BIR trigger function for setting audit columns where no data_statuses

select rlm.register_component ( 'CIN', 'fnc_trg_bir_audit.sql' );

create or replace function cin.bir_audit()
  returns trigger
as $bir_audit$
  begin

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
$bir_audit$ LANGUAGE plpgsql;

select rlm.component_registered ( 'fnc_trg_bir_audit.sql' );
