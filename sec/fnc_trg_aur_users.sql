\qecho Creating AUR trigger function for populating password histories

select rlm.register_component('SEC', 'fnc_trg_aur_users.sql');

create or replace function sec.aur_users()
  returns trigger
as $bur_users$ 
  begin

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
        ,current_timestamp
        );
    end if;

    return null;

  end;
$bur_users$ LANGUAGE plpgsql;

comment on function sec.aur_users() is '@DOCBOOK After Update Row trigger to populate <link linkend="sec-table-user_password_histories">USER_PASSWORD_HISTORIES.</link>.';

select rlm.component_registered('SEC', 'fnc_trg_bur_users.sql');

