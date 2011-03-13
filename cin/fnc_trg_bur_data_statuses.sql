\qecho Creating BUR trigger function for setting data_statuses and audit

select rlm.register_component('CIN', 'fnc_trg_bur_data_statuses.sql');

create or replace function cin.bur_data_statuses()
  returns trigger
as $bur_data_statuses$
  begin
    
    select cin.calc_data_status_code
      (old.data_status_code
      ,new.data_status_code
      )
      into new.data_status_code;

    if new.updated_by is null
    then
      new.updated_by := session_user;
    end if;

    new.updated_at := current_timestamp;

    return new;

  end;
$bur_data_statuses$ LANGUAGE plpgsql;

select rlm.component_registered('fnc_trg_bur_data_statuses.sql');
