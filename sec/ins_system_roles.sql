\qecho Inserting System Roles...

select rlm.register_component ( 'SEC', 'ins_system_roles.sql' );

begin;
insert into sec.system_roles ( role_name, description ) values ( 'ref_data_admin', 'Reference Data Administrator' );
insert into sec.system_roles ( role_name, description ) values ( 'employee_admin', 'Employee Data Administrator' );
insert into sec.system_roles ( role_name, description ) values ( 'security_admin', 'User Administrator' );
insert into sec.system_roles ( role_name, description ) values ( 'system_admin', 'Cromby System Administrator' );
commit;

select rlm.component_registered ( 'ins_system_roles.sql' );

\qecho System Roles inserted
