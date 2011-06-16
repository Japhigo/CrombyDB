\echo Creating function upd_user_password

select rlm.register_component('PUB', 'fnc_upd_user_password.sql');

create or replace function public.upd_user_password
  (p_hashed_password  text
  ,p_salt             text
  ,p_user_uuid        uuid
  )
  returns void
  security definer
as $$
  declare

    v_password_history_count  int := 0;
    v_user_id                 int;

    c_sec cursor
    for
      select days_until_password_expiry
            ,password_history_count
        from sec.security_controls;

    r_security_controls  record;

    c_usr cursor
      (p_user_uuid  uuid)
    for
      select id
        from sec.users usr
       where usr.user_uuid = p_user_uuid;

    c_uph cursor
      (p_user_id  int)
    for
      select id
        from sec.user_password_histories uph
       where uph.user_id = p_user_id
       order by id;

  begin

    open c_sec;
    fetch c_sec into r_security_controls;
    close c_sec;

    open c_usr(p_user_uuid);
    fetch c_usr into v_user_id;
    close c_usr;

    for r_uph in c_uph
      (v_user_id)
    loop
      v_password_history_count := v_password_history_count + 1;
      if v_password_history_count >= r_security_controls.password_history_count
      then
        delete from user_password_histories
        where  id = r_uph.id;
      end if;
    end loop;
  
    update sec.users
       set hashed_password = p_hashed_password           
          ,salt = p_salt
          ,updated_by = user_name
          ,updated_at = current_timestamp
          ,password_expiry_date = current_date + r_security_controls.days_until_password_expiry
     where user_uuid = p_user_uuid;

  end;
$$ language plpgsql;

comment on function public.upd_user_password
  (p_hashed_password  text
  ,p_salt             text
  ,p_user_uuid        uuid
  )
is '@DOCBOOK Updates a user''s password and salt.';

select rlm.component_registered('fnc_upd_user_password.sql');
