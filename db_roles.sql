\qecho Creating non-login database roles...

select rlm.register_component('PUB', 'db_roles.sql');

\qecho Create role ref_data_admin

create role ref_data_admin nologin inherit;
comment on role ref_data_admin is 'Role to maintain reference data.';
grant ref_data_admin to am_user;

\qecho Create role employee_admin

create role employee_admin nologin inherit;
comment on role employee_admin is 'Role to maintain employee and organisation data.';
grant employee_admin to am_user;

\qecho Create role security_admin

create role security_admin nologin inherit;
comment on security_admin is 'Role to maintain Cromby user data.';
grant security_admin to am_user;

\qecho Create role system_admin

create role system_admin nologin inherit;
comment on system_admin is 'Role to carry out system administration tasks.';
grant system_admin to am_user;

\qecho Create role cromby_archivist

create role cromby_archivist nologin inherit;
comment on cromby_archivist is 'Role to carry out data cleanup and archiving.';
grant system_admin to batch_user;

select rlm.component_registered('PUB', 'db_roles.sql');

\qecho Non-login database roles created
