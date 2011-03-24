\echo Creating function upd_user_password

select rlm.register_component('PUB', 'fnc_upd_user_password.sql');

create or replace function public.upd_user_password
  (p_hashed_password  text
  ,p_salt             text
  ,p_user_uuid        uuid
  )
  returns int
  security definer
as $$
  declare

    v_dummy          int;
    v_password_used  boolean;
    v_result         int := 0;
 
    c_usp cursor
      (p_user_uuid        uuid
      ,p_hashed_password  text
      )
    for
      select 1
        from sec.users usr join
             sec.user_password_histories usp on usp.user_id = usr.id
       where usp.hashed_password = p_hashed_password;

  begin

    open c_usp
      (p_user_uuid
      ,p_hashed_password
      );
    fetch c_usp into v_dummy;
    v_password_used := FOUND;
    close c_usp;

    if not v_password_used
    then
      update sec.users
         set hashed_password = p_hash
            ,salt = p_salt
            ,updated_by = user_name
            ,updated_at = current_timestamp
            ,password_expiry_date = current_date + 60 --magic number store as a parameter
       where user_uuid = p_user_uuid;
    else
      v_result := 1;
    end if;

    return v_result;

  end;
$$ language plpgsql;

select rlm.component_registered('fnc_upd_user_password.sql');
