\qecho Installing Security component...

select rlm.register_component('SEC', 'sec.sql');

\qecho Creating Security schema

create schema sec;
	
comment on schema sec is '@DOCBOOK Security objects to handle users, passwords and user roles.';
	
--
-- Tables
--
\i tab_controllers.sql

\i tab_non_user_logins.sql;

\i tab_security_controls.sql

\i tab_system_roles.sql

\i tab_users.sql

\i tab_user_login_histories.sql

\i tab_user_password_histories.sql

\i tab_controllers_by_system_role.sql

\i tab_default_roles.sql

\i tab_user_roles.sql

--
-- indexes
--
\i idx_users.sql

--
-- functions
--
\i fnc_trg_bir_users.sql

\i fnc_trg_bur_users.sql

\i fnc_trg_bir_sec_audit.sql

\i fnc_trg_bur_sec_audit.sql

\i fnc_unlock_account.sql

--
-- triggers
--
\i trg_bir_controllers.sql

\i trg_bir_controllers_by_system_role.sql

\i trg_bir_default_roles.sql

\i trg_bir_users.sql

\i trg_bir_system_roles.sql

\i trg_bir_user_roles.sql

\i trg_bur_controllers.sql

\i trg_bur_controllers_by_system_role.sql

\i trg_bur_default_roles.sql

\i trg_bur_users.sql

\i trg_bur_security_controls.sql

\i trg_bur_system_roles.sql

\i trg_bur_user_roles.sql

--
-- data population
--
\i ins_security_controls.sql

\i ins_system_roles.sql
 
\i ins_controllers.sql

\i ins_initial_users.sql
 
select rlm.component_registered('SEC', 'sec.sql');

\qecho Security component installed
