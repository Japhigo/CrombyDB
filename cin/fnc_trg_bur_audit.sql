\qecho Creating BUR trigger function for setting audit columns where no data_statuses

select rlm.register_component ( 'CIN', 'fnc_trg_bur_audit.sql' );

create or replace function cin.bur_audit()
  returns trigger
as $bur_audit$
  begin

    if new.updated_date_time is null
    then
      new.updated_date_time := current_timestamp;
    end if;

    if new.updated_by is null
    then
      new.updated_by := session_user;
    end if;

    return new;

  end;
$bur_audit$ LANGUAGE plpgsql;

select rlm.component_registered ( 'fnc_trg_bur_audit.sql' );