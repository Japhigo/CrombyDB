\qecho Creating function authenticate_user

select rlm.register_component ( 'PUB', 'fnc_authenticate_user.sql' );

create or replace function public.authenticate_user
    ( p_user_name  varchar(30)
    , p_password   text
    )
    returns uuid
    security definer
as $$
  declare

    v_user_uuid        uuid;

    c_usr cursor
      ( p_user_name  varchar(30)
      , p_password   text
      )
    for
      select user_uuid
        from sec.users
       where user_name = p_user_name
         and p_password = p_password;

  begin

    open c_usr
      ( p_user_name
	  , p_password
	  );
    fetch c_usr into v_user_uid;
    close c_usr;

    return v_user_uid;

  end;
$$ language plpgsql;

select rlm.component_registered ( 'fnc_authenticate_user.sql' );



