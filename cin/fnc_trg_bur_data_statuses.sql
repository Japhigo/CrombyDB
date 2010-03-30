\qecho Creating BUR trigger function for setting data_statuses and audit

select rlm.register_component ( 'CIN', 'fnc_trg_bur_data_statuses.sql' );

create or replace function cin.bur_data_statuses()
  returns trigger
as $bur_data_statuses$
  begin
    if old.data_status_code = -1
    then
      new.data_status_code := 0;
    
    elsif old.data_status_code = 0
    then
      new.data_status_code := 3;

    elsif old.data_status_code = 1
    then
      new.data_status_code := 2;

    end if;

    new.updated_date_time := current_timestamp;

    return new;

  end;
$bur_data_statuses$ LANGUAGE plpgsql;

select rlm.component_registered ( 'fnc_trg_bur_data_statuses.sql' );
