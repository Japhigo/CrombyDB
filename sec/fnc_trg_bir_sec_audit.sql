\qecho Creating BIR trigger function for setting audit columns on security tables

select rlm.register_component('SEC', 'fnc_trg_bir_sec_audit.sql');

create or replace function sec.bir_sec_audit()
  returns trigger
as $bir_sec_audit$
  begin

    if new.created_by is null
    then
      new.created_by := session_user;
    end if;

    if new.updated_by is null
    then
      new.updated_by := session_user;
    end if;

    if new.created_at is null
    then
      new.created_at := current_timestamp;
    end if;

    if new.updated_at is null
    then
      new.updated_at := current_timestamp;
    end if;

    return new;

  end;
$bir_sec_audit$ LANGUAGE plpgsql;

comment on function sec.bir_sec_audit() is '@DOCBOOK Before Insert Row trigger to populate audit columns.';

select rlm.component_registered('SEC', 'fnc_trg_bir_sec_audit.sql');
