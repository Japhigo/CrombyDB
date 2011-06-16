\echo Creating rule upd_vw_users_rule

select rlm.register_component('PUB', 'rul_upd_vw_users.sql');

create or replace rule upd_vw_users_rule as on update to public.vw_users
do instead
  select public.upd_user_password
           (new.hashed_password
           ,new.salt
           ,new.user_uuid
           );

select rlm.component_registered('rul_upd_vw_users.sql');
