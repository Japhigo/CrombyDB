\qecho Creating BIR trigger function for users

select rlm.register_component('SEC', 'fnc_trg_bir_users.sql' );

create or replace function sec.bir_users()
  returns trigger
  security definer
as $bir_users$
  begin

    select uuid_generate_v1() into new.user_uuid;

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
$bir_users$ LANGUAGE plpgsql;

select rlm.component_registered('fnc_trg_bir_users.sql');
