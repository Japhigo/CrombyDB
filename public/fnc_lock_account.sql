\echo Creating function lock_account

select rlm.register_component('PUB', 'fnc_lock_account.sql');

create or replace function public.lock_account
  (p_user_name  varchar(30))
  returns void
  security definer
as $$
  begin

    update sec.users
       set locked_account = true
          ,updated_by = p_user_name
     where user_name = p_user_name;

  end;
$$ language plpgsql;

select rlm.component_registered('fnc_lock_account.sql');
