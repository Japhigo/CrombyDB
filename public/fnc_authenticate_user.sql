\qecho Creating function authenticate_user

select rlm.register_component('PUB', 'fnc_authenticate_user.sql');

create or replace function public.authenticate_user
  (p_user_name         varchar(30)
  ,p_hashed_password   text
  )
  returns uuid
  security definer
as $$
  declare

    v_user_uuid  uuid;

    c_usr cursor
      (p_user_name  uuid
      ,p_password  text
      )
    for
      select usr.user_uuid
        from sec.users usr
       where usr.user_name = p_user_name
         and usr.hashed_password = p_password;

  begin

    open c_usr
      (p_user_name
      ,p_hashed_password
      );
    fetch c_usr into v_user_uuid;
    close c_usr;

    return v_user_uuid;

  end;
$$ language plpgsql;

select rlm.component_registered('fnc_authenticate_user.sql');

