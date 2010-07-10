\qecho Creating BIR trigger function for setting audit columns on security tables

select rlm.register_component ( 'SEC', 'fnc_trg_bir_sec_audit.sql' );

create or replace function sec.bir_sec_audit()
  returns trigger
as $bir_sec_audit$
  begin

    if new.created_date_time is null
    then
      new.created_date_time := current_timestamp;
    end if;

    if new.created_by is null
    then
      new.created_by := session_user;
    end if;

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
$bir_sec_audit$ LANGUAGE plpgsql;

select rlm.component_registered ( 'fnc_trg_bir_sec_audit.sql' );
