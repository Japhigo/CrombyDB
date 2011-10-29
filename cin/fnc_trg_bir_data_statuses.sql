\qecho Creating BIR trigger function for setting data_statuses and audit

select rlm.register_component('CIN', 'fnc_trg_bir_data_statuses.sql');

create or replace function cin.bir_data_statuses()
  returns trigger
as $bir_data_statuses$
  begin
    
    if new.data_status_code is null
    then
      new.data_status_code := 1;
    end if;

    if new.effective_from_date is null
    then
      new.effective_from_date := current_date;
    end if;

    if new.created_by is null
    then
      new.created_by := session_user;
    end if;

    if new.updated_by is null
    then
      new.updated_by := session_user;
    end if;

    new.created_at := current_timestamp;
    new.updated_at := current_timestamp;

    return new;

  end;
$bir_data_statuses$ LANGUAGE plpgsql;

comment on function cin.bir_data_statuses() is '@DOCBOOK Before Insert Row trigger to populate audit and data status columns.';

select rlm.component_registered('CIN', 'fnc_trg_bir_data_statuses.sql');
