\qecho Creating BUR trigger function for setting data_statuses and audit

select rlm.register_component('CIN', 'fnc_trg_bur_data_statuses.sql');

create or replace function cin.bur_data_statuses()
  returns trigger
as $bur_data_statuses$
  begin
    
    select cin.calc_data_status_code
      (old.data_status_code
      ,new.data_status_code
      ,new.effective_from_date
      ,old.effective_to_date
      ,new.effective_to_date
      )
      into new.data_status_code;

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
$bur_data_statuses$ LANGUAGE plpgsql;

comment on function cin.bur_data_statuses() is '@DOCBOOK Before Update Row trigger to populate audit columns and set the data status code.';

select rlm.component_registered('CIN', 'fnc_trg_bur_data_statuses.sql');
