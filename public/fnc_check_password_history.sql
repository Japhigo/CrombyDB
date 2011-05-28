\echo Creating function check_password_history

select rlm.register_component('PUB', 'fnc_check_password_history.sql');

create or replace function public.check_password_history
  (p_user_uuid  uuid)
  returns table(id    int
	           ,salt  text
               )
  security definer
as $$
  --declare

  --begin

  select id
        ,salt
    from sec.user_password_histories uph join
         sec.users usr on uph.user_id = usr.id
   where usr.user_uuid = p_user_uuid;
   
  --end;
$$ language plpgsql;

select rlm.component_registered('fnc_check_password_history.sql');
