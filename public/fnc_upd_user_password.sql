\echo Creating function upd_user_password

select rlm.register_component('PUB', 'fnc_upd_user_password.sql');

create or replace function public.upd_user_password
  (p_hash       text
  ,p_salt       text
  ,p_user_uuid  uuid
  )
  returns void
  security definer
as $$
  begin

    update sec.users
       set hashed_password = p_hash
          ,salt = p_salt
          ,updated_by = user_name
          ,updated_at = current_timestamp
          ,password_expiry_date = current_date + 60 --magic number store as a parameter
     where user_uuid = p_user_uuid;

  end;
$$ language plpgsql;

select rlm.component_registered('fnc_upd_user_password.sql');
