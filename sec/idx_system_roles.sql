\qecho Creating indexes on system_roles

select rlm.register_component ('SEC', 'idx_system_roles.sql');

create unique index system_roles_role_name_idx on sec.system_roles(lower(role_name));

select rlm.component_registered('SEc', 'idx_system_roles.sql');
