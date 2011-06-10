\qecho Creating function fnc_user_name

select rlm.register_component( 'PUB', 'fnc_user_name.sql');

create or replace function public.user_name
  (p_user_uuid  uuid)
  returns varchar(30)
  security definer
as $$
  declare

    v_user_name      varchar(30);

    c_usr cursor
      (p_user_uuid   uuid)
    for
      select usr.user_name
        from sec.users usr
       where usr.user_uuid = p_user_uuid;

  begin

    open c_usr(p_user_uuid);
    fetch c_usr into v_user_name;
    close c_usr;
 
    return v_user_name;

  end;
$$ language plpgsql;

comment on function public.user_name
  (p_user_uuid  uuid)
  is '@DOCBOOK Returns username associated with a UUID.';

select rlm.component_registered('fnc_user_name.sql');

