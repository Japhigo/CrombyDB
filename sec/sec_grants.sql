\qecho Creating grants...

select rlm.register_component('SEC', 'sec_grants.sql');

\qecho Assign grants to security_admin role

grant select on sec.login_histories to security_admin;
grant select on sec.controllers to security_admin;
grant select, update on sec.security_controls to security_admin;
grant select on sec.system_roles to security_admin;
grant select, insert, update on sec.users to security_admin;
grant select on sec.user_password_histories to security_admin;
grant select, insert, update, delete on sec.controllers_by_system_role to security_admin;
grant select, insert, update on sec.default_roles to security_admin;
grant select on sec.user_roles to security_admin;
grant select on sec.menu_sets to security_admin;
grant select on sec.menus to security_admin;
grant select on sec.menu_items to security_admin;

\qecho Assign grants to cromby_archivist role

grant select, delete on sec.login_histories to security_admin;
grant select, delete on sec.users to security_admin;
grant select,delete on sec.user_password_histories to security_admin;
grant select, delete on sec.controllers_by_system_role to security_admin;
grant select, delete on sec.default_roles to security_admin;

select rlm.component_registered('SEC', 'sec_grants.sql');

\qecho Grants created
