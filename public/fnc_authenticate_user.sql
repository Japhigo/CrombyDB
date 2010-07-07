\qecho Creating function authenticate_user

select rlm.register_component ( 'PUB', 'fnc_authenticate_user.sql' );

create or replace function public.authenticate_user
    ( p_user_name  varchar(30)
    , p_password   text
    )
    returns boolean
    security definer
as $$
  declare

    v_dummy  int;

    c_usr cursor
      ( p_user_name  varchar(30)
      , p_password   text
      )
    for
      select 1
        from sec.users
       where user_name = p_user_name
         and p_password = p_password;

  begin

    open c_usr
      ( p_user_name
	  , p_password
	  );
    fetch c_usr into v_dummy;
    close c_usr;

    return v_dummy = 1;

  end;
$$ language plpgsql;

select rlm.component_registered ( 'fnc_authenticate_user.sql' );



