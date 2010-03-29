\qecho Creating BUR trigger function for marital_statuses

select rlm.register_component ( 'CIN', 'fnc_trg_bur_marital_statuses.sql' );

create or replace function cin.bur_marital_statuses()
  returns trigger
as $bur_marital_statuses$
  begin
    if old.data_status_code = -1
    then
      new.data_status_code := 0;
    
    elsif old.data_status_code = 1
    then
      new.data_status_code := 2;

    end if;

    new.updated_date_time := current_timestamp;

  end;
$bur_marital_statuses$ LANGUAGE plpgsql;

select rlm.component_registered ( 'fnc_trg_bur_marital_statuses.sql' );
