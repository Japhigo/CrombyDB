\qecho Creating BIR trigger function for setting audit columns on security tables

select rlm.register_component('SEC', 'fnc_trg_bir_sec_audit.sql');

create or replace function sec.bir_sec_audit()
  returns trigger
as $bir_sec_audit$
  declare

    v_timestamp  timestamp   := current_timestamp;
    v_user       varchar(30) := session_user;

  begin

    if new.created_by is null
    then
      new.created_by := v_user;
    end if;

    if new.updated_by is null
    then
      new.updated_by := v_user;
    end if;

    new.created_at := v_timestamp;
    new.updated_at := v_timestamp;

    return new;

  end;
$bir_sec_audit$ LANGUAGE plpgsql;

comment on function sec.bir_sec_audit() is 'Before Insert Row trigger to populate audit columns.';

select rlm.component_registered('fnc_trg_bir_sec_audit.sql');
