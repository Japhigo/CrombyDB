\qecho Creating function authorize_user

select rlm.register_component ( 'PUB', 'fnc_authorize_user.sql' );

create or replace function public.authorize_user
    ( p_user_uid   uuid
    , p_role_name  varchar(30)
    )
    returns varchar(30)
    security definer
as $$
  declare

    v_user_name  varchar(30);

    c_usr cursor
      ( p_user_uid   uuid
      , p_role_name  varchar(30)
      )
    for
      select usr.user_name
        from sec.users usr join
             sec.user_roles uro on uro.user_id = usr.id join
             sec.system_roles sro on sro.id = uro.system_role_id
       where usr.user_uid = p_user_uid
         and syr.role_name = p_role_name;

  begin

    open c_usr
      ( p_user_uid
	  , p_role_name
	  );
    fetch c_usr into v_user_name;
    close c_usr;

    return v_user_name;

  end;
$$ language plpgsql;

select rlm.component_registered ( 'fnc_authorize_user.sql' );



