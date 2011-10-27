\qecho Creating indexes on system_roles

select rlm.register_component ('SEC', 'idx_system_roles.sql');

create unique index system_roles_role_name_idx on sec.system_roles(lower(role_name));

comment on index sec.system_roles_role_name_idx is '@DOCBOOK Index to enforce uniqueness of SYSTEM_ROLES.ROLE_NAME.';

select rlm.component_registered('SEc', 'idx_system_roles.sql');
