\qecho Creating grants...

select rlm.register_component('SEC', 'sec_grants.sql');

--\qecho Assign grants to security_admin role

--grant select on sec.login_histories to security_admin;
--grant select on sec.user_password_histories to security_admin;
--grant select, update on sec.security_controls to security_admin;
--grant select on sec.system_roles to security_admin;
--grant select, insert, update on sec.users to security_admin;
--grant select, insert, update, delete on sec.default_roles to security_admin;
--grant select, insert, update on sec.user_roles to security_admin;

--\qecho Assign grants to cromby_archivist role

--grant select, delete on sec.login_histories to cromby_archivist;
--grant select, delete on sec.users to cromby_archivist;
--grant select, delete on sec.user_password_histories to cromby_archivist;
--grant select, delete on sec.user_roles to cromby_archivist;

select rlm.component_registered('SEC', 'sec_grants.sql');

\qecho Grants created
