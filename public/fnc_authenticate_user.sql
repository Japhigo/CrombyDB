\qecho Creating function authenticate_user

select rlm.register_component('PUB', 'fnc_authenticate_user.sql');

create or replace function public.authenticate_user
  (p_user_name        varchar(30)
  ,p_hashed_password  text
  )
  returns uuid
  security definer
as $$
  declare

    v_login_successful  boolean := false;
    v_user_found        boolean := false;
    v_user_uuid         uuid;

    c_usr cursor
      (p_user_name  varchar(30))
    for
      select usr.id
            ,usr.user_uuid
            ,usr.hashed_password
        from sec.users usr
       where usr.user_name = p_user_name;

    r_usr  record;

  begin

    open c_usr(p_user_name);
    fetch c_usr into r_usr;
    v_user_found := found;
    close c_usr;

    if not v_user_found
    --if r_usr.user_uuid is null 
    then
      insert into sec.non_user_logins
        (user_name
        ,session_user_name
        ,current_user_name
        ,client_address
        ,created_at
        )
      values
        (p_user_name
        ,session_user
        ,current_user
        ,inet_client_addr()
        ,current_timestamp
        );

    else
      if r_usr.hashed_password = p_hashed_password
      then
        v_user_uuid := r_usr.user_uuid;
        v_login_successful := true;
      else
        v_login_successful := false;
      end if;

      insert into sec.user_login_histories
        (user_id
        ,login_successful
        ,session_user_name
        ,current_user_name
        ,client_address
        ,created_by
        ,created_at
        )
      values
        (r_usr.id
        ,v_login_successful
        ,session_user
        ,current_user
        ,inet_client_addr()
        ,p_user_name
        ,current_timestamp
        );
    end if;

    return v_user_uuid;

  end;
$$ language plpgsql;

comment on function public.authenticate_user
  (p_user_name        varchar(30)
  ,p_hashed_password  text
  ) is '@DOCBOOK Checks supplied username and hashed password are correct, and if so returns the user''s UUID.';

select rlm.component_registered('fnc_authenticate_user.sql');

