\qecho Creating BIR trigger function for ref_data_tables

select rlm.register_component ( 'CIN', 'fnc_trg_bir_ref_data_tables.sql' );

create or replace function cin.bir_ref_data_tables()
  returns trigger
as $bir_ref_data_tables$
  begin

    if new.code_mandatory is null
    then
      new.code_mandatory := false;
    end if;

    if new.description_mandatory is false
    then
      new.description_mandatory := false;
    end if;

    if new.code_min_length is null and new.code_max_length is not null
    then
      new.code_min_length := 0;
    end if;

    if new.code_min_length is not null and new.code_max_length is null
    then
      new.code_max_length := 10;
    end if;

    if new.created_date_time is null
    then
      new.created_date_time := current_timestamp;
    end if;

    if new.created_by is null
    then
      new.updated_by := session_user;
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
$bir_ref_data_tables$ LANGUAGE plpgsql;

select rlm.component_registered ( 'fnc_trg_bir_ref_data_tables.sql' );
