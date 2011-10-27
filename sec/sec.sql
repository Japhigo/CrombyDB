\qecho Installing Security component...

select rlm.register_component('SEC', 'sec.sql');

\qecho Creating Security schema

create schema sec;
	
comment on schema sec is '@DOCBOOK Security objects to handle users, passwords and user roles.';
	
--
-- Tables
--
\i tab_login_histories.sql

\i tab_controllers.sql

\i tab_security_controls.sql

\i tab_system_roles.sql

\i tab_users.sql

\i tab_user_password_histories.sql

\i tab_controllers_by_system_role.sql

\i tab_default_roles.sql

\i tab_user_roles.sql

\i tab_menu_sets.sql

\i tab_menus.sql

\i tab_menu_items.sql

--
-- Indexes
--
\i idx_controllers.sql

\i idx_system_roles.sql

\i idx_users.sql

\i idx_menu_sets.sql

\i idx_menus.sql

--
-- Functions
--
\i fnc_trg_aur_users.sql

\i fnc_trg_bir_users.sql

\i fnc_trg_bir_sec_audit.sql

\i fnc_trg_bur_sec_audit.sql

--
-- triggers
--
\i trg_aur_users.sql

\i trg_bir_controllers.sql

\i trg_bir_controllers_by_system_role.sql

\i trg_bir_default_roles.sql

\i trg_bir_menu_items.sql

\i trg_bir_menus.sql

\i trg_bir_menu_sets.sql

\i trg_bir_security_controls.sql

\i trg_bir_system_roles.sql

\i trg_bir_user_roles.sql

\i trg_bir_users.sql

\i trg_bur_controllers.sql

\i trg_bur_controllers_by_system_role.sql

\i trg_bur_default_roles.sql

\i trg_bur_menu_items.sql

\i trg_bur_menus.sql

\i trg_bur_menu_sets.sql

\i trg_bur_security_controls.sql

\i trg_bur_system_roles.sql

\i trg_bur_user_roles.sql

\i trg_bur_users.sql

--
-- data population
--
\i ins_security_controls.sql

\i ins_system_roles.sql
 
\i ins_controllers.sql

\i ins_initial_users.sql

\i ins_menu_sets.sql

\i ins_menus.sql

--
-- grants
--
\i sec_grants.sql

select rlm.component_registered('SEC', 'sec.sql');

\qecho Security component installed
