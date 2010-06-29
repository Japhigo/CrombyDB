\echo Creating function upd_user_password

select rlm.register_component ( 'PUB', 'fnc_upd_user_password.sql' );

create or replace function public.upd_user_password
    ( p_hashed_password  text
    , p_user_uuid        uuid
    )
    returns void
    security definer
as $$
  begin

    update sec.users
	   set hashed_password = p_hashed_password
          ,updated_by = user_name
          ,updated_date_time = current_timestamp
     where user_uuid = p_user_uuid;

  end;
$$ language plpgsql;

select rlm.component_registered ( 'fnc_upd_user_password.sql' );
