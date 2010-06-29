\qecho Creating function authorize_user

select rlm.register_component ( 'PUB', 'fnc_authorize_user.sql' );

create or replace function public.authorize_user
    ( p_user_uid   uuid
    , p_role_name  varchar(30)
    )
    returns boolean
    security definer
as $$
  declare

    v_dummy  int;

    c_usr cursor
      ( p_user_uid   uuid
      , p_role_name  varchar(30)
      )
    for
      select 1
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
    fetch c_usr into v_dummy;
    close c_usr;

    return v_dummy = 1;

  end;
$$ language plpgsql;

select rlm.component_registered ( 'fnc_authorize_user.sql' );



