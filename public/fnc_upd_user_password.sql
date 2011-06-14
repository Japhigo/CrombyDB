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

    v_password_history_count  int;

    c_sec cursor
    for
      select days_until_password_expiry
            ,password_history_count
        from sec.security_controls;

    r_security_controls  record;

    c_usp cursor
      (p_user_uuid  uuid)
    for
      select count(*)
        from sec.users usr join
             sec.user_password_histories usp on usp.user_id = usr.id
       where usr.user_uuid = p_user_uuid;

    c_usp_ cursor
      (p_user_uuid  uuid)
    for
      select count(*)
        from sec.users usr join
             sec.user_password_histories usp on usp.user_id = usr.id
       where usr.user_uuid = p_user_uuid;

  begin

    open c_sec;
    fetch c_sec into r_security_controls;
    close c_sec;

    open c_usp(p_user_uuid);
    fetch c_usp into v_password_history_count;
    close c_usp;

    if v_password_history_count >= r_security_controls.password_history_count
    then
      -- need to delete the earliest history
      null;
    end if;
      
    update sec.users
       set hashed_password = p_hash           
          ,salt = p_salt
          ,updated_by = user_name
          ,updated_at = current_timestamp
          ,password_expiry_date = current_date + r_security_controls.days_until_password_expiry;
     where user_uuid = p_user_uuid;

    return v_result;

  end;
$$ language plpgsql;

select rlm.component_registered('fnc_upd_user_password.sql');
