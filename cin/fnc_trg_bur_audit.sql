\qecho Creating BUR trigger function for setting audit columns where no data_statuses

select rlm.register_component('CIN', 'fnc_trg_bur_audit.sql');

create or replace function cin.bur_audit()
  returns trigger
as $bur_audit$
  begin

    --
    -- Ensure these values are not updated
    -- 
    new.created_by := old.created_by;
    new.created_at := old.created_at;

    if new.updated_by is null
    then
      new.updated_by := session_user;
    end if;

    new.updated_at := current_timestamp;

    return new;

  end;
$bur_audit$ LANGUAGE plpgsql;

comment on function cin.bur_audit() is '@DOCBOOK Before Update Row trigger to populate audit columns.';

select rlm.component_registered('CIN', 'fnc_trg_bur_audit.sql');
