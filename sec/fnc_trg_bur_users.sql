\qecho Creating BUR trigger function for setting audit columns on the users table

select rlm.register_component('SEC', 'fnc_trg_bur_users.sql');

create or replace function sec.bur_users()
  returns trigger
as $bur_users$
  begin

    if new.updated_by is null
    then
      new.updated_by := session_user;
    end if;

    new.updated_at := current_timestamp;

    if new.hashed_password != old.hashed_password
    then
      insert into sec.user_password_histories
        (user_id
        ,hashed_password
        ,created_by
        ,created_at
        )
      values
        (old.id
        ,old.hashed_password
        ,new.updated_by
        ,current_timestamp
        );
    end if;

    return new;

  end;
$bur_users$ LANGUAGE plpgsql;

select rlm.component_registered('fnc_trg_bur_users.sql');

