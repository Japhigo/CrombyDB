\qecho Creating BIR trigger function for ref_data_tables

select rlm.register_component('CIN', 'fnc_trg_bir_ref_data_tables.sql');

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
$bir_ref_data_tables$ LANGUAGE plpgsql;

comment on function cin.bir_ref_data_tables() is '@DOCBOOK Before Insert Row trigger on REF_DATA_TABLES to check audit columns and set default values.';

select rlm.component_registered('CIN', 'fnc_trg_bir_ref_data_tables.sql');
