\qecho Creating function authorize_user

select rlm.register_component( 'PUB', 'fnc_authorize_user.sql');

create or replace function public.authorize_user
  (p_user_uuid   uuid
  ,p_controller  varchar(255)
  )
  returns authorisation
  security definer
as $$
  declare

    v_auth_level     int;      
    v_authorisation  authorisation;
    v_user_name      varchar(30);
    v_user_id        int;

    c_usr cursor
      (p_user_uuid   uuid
      ,p_controller  varchar(255)
      )
    for
      select usr.user_name
            ,usr.id
        from sec.users usr
       where usr.user_uuid = p_user_uuid;

    c_uro cursor
      (p_user_id     uuid
      ,p_controller  varchar(255)
      )
    for
      select 1
        from sec.user_roles uro join
             sec.controllers_by_system_role cbs on cbs.system_role_id = uro.system_role_id join
             sec.controllers con on con.id = cbs.controller_id
       where uro.user_id = p_user_id
         and sro.role_name = p_controller;

  begin

    open c_usr
      (p_user_uuid
      ,p_controller
      );
    fetch c_usr into v_user_name
                    ,v_user_id;
    close c_usr;
 
    v_auth_level := 0;

    open c_uro
      (v_user_id,
	   p_controller);
	fetch c_uro into v_auth_level;
	close c_uro;

    v_authorisation.user_name := v_user_name;
    v_authorisation.auth_level := v_auth_level;

    return v_authorisation;

  end;
$$ language plpgsql;

comment on function public.authorize_user
  (p_user_uuid   uuid
  ,p_controller  varchar(255)
  ) is '@DOCBOOK Validates user''s UUID and returns authorisation for the controller.';

select rlm.component_registered('fnc_authorize_user.sql');

