\qecho Creating view on users permissions

select rlm.register_component('PUB', 'viw_user_permissions.sql');

create or replace view public.vw_user_permissions
as
  select usr.user_id
        ,ctr.controller
        ,ctr.id
    from sec.users usr join
         sec.user_roles uro on uro.user_id = usr.id join
         sec.controllers_by_system_role csr on csr.system_role_id = uro.system_role_id join
         sec.controllers ctr on ctr.id = csr.controller_id
   where current_date >= usr.user_start_date
     and current_date <= coalesce(usr.user_end_date, current_date)
     and current_date >= uro.user_role_start_date
     and current_date <= coalesce(uro.user_role_end_date, current_date);

comment on view public.vw_user_permissions is '@DOCBOOK Controllers available to a user.';

select rlm.component_registered('PUB', 'viw_user_permissions.sql');
