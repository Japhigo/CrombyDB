\qecho Creating BUR trigger function for ref_data_tables

select rlm.register_component('CIN', 'fnc_trg_bur_ref_data_tables.sql');

create or replace function cin.bur_ref_data_tables()
  returns trigger
as $bur_ref_data_tables$
  begin

    --
    -- Ensure these values are not updated
    -- 
    new.table_name := old.table_name;
    new.created_by := old.created_by;
    new.created_at := old.created_at;

    if new.updated_by is null
    then
      new.updated_by := session_user;
    end if;

    new.updated_at := current_timestamp;

    return new;

  end;
$bir_ref_data_tables$ LANGUAGE plpgsql;

comment on function cin.bur_ref_data_tables() is '@DOCBOOK Controls columns updated and sets audit columns.';

select rlm.component_registered('fnc_trg_bir_ref_data_tables.sql');
