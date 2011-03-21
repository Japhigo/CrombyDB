\echo Creating function unlock_account

select rlm.register_component('SEC', 'fnc_unlock_account.sql');

create or replace function sec.unlock_account
  (p_user_name   varchar(30)
  ,p_updated_by  varchar(30)
  )
  returns void
as $$
  begin

    update sec.users
       set locked_account = false
          ,updated_by = p_updated_by
     where user_name = p_user_name;

  end;
$$ language plpgsql;

select rlm.component_registered('fnc_unlock_account.sql');
