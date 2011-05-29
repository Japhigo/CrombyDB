\qecho Creating BUR trigger function for setting audit columns on the users table

select rlm.register_component('SEC', 'fnc_trg_bur_users.sql');

create or replace function sec.bur_users()
  returns trigger
as $bur_users$ 
  declare

    v_timestamp  timestamp := current_timestamp;

  begin

    if new.updated_by is null
    then
      new.updated_by := session_user;
    end if;

    if new.updated_at is null
    then
      new.updated_at := v_timestamp;
    end if;

    if new.hashed_password != old.hashed_password
    then
      insert into sec.user_password_histories
        (user_id
        ,hashed_password
        ,salt
        ,created_by
        ,created_at
        )
      values
        (old.id
        ,old.hashed_password
        ,old.salt
        ,new.updated_by
        ,v_timestamp
        );
    end if;

    return new;

  end;
$bur_users$ LANGUAGE plpgsql;

select rlm.component_registered('fnc_trg_bur_users.sql');

