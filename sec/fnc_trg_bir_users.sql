\qecho Creating BIR trigger function for users

select rlm.register_component ( 'SEC', 'fnc_trg_bir_users.sql' );

create or replace function sec.bir_users()
  returns trigger
  security definer
as $bir_users$
  begin

    select uuid_generate_v1() into new.uuid;

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
$bir_users$ LANGUAGE plpgsql;

select rlm.component_registered ( 'fnc_trg_bir_users.sql' );
