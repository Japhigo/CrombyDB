\echo Creating rule upd_view_users_rule

select rlm.register_component ( 'PUB', 'rul_upd_view_users.sql' );

create or replace rule upd_view_users_rule as on update to public.view_users
do instead
  select public.upd_user_password
           ( new.hash
	       , new.salt
           , new.user_uuid
           );

select rlm.component_registered ( 'rul_upd_view_users.sql' );
