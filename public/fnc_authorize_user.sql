\qecho Creating function authorize_user

select rlm.register_component( 'PUB', 'fnc_authorize_user.sql');

create or replace function public.authorize_user
  (p_user_uuid   uuid
  ,p_controller  varchar(255)
  )
  returns varchar(30)
  security definer
as $$
  declare

    v_user_name  varchar(30);

    c_usr cursor
      (p_user_uuid   uuid
      ,p_controller  varchar(255)
      )
    for
      select usr.user_name
        from sec.users usr join
             sec.user_roles uro on uro.user_id = usr.id join
             sec.controllers_by_system_role cbs on cbs.system_role_id = uro.system_role_id join
             sec.controllers con on con.id = cbs.controller_id
       where usr.user_uuid = p_user_uuid
         and sro.role_name = p_controller;

  begin

    open c_usr
      (p_user_uuid
      ,p_controller
      );
    fetch c_usr into v_user_name;
    close c_usr;

    return v_user_name;

  end;
$$ language plpgsql;

select rlm.component_registered('fnc_authorize_user.sql');

