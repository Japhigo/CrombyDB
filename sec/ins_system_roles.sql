\qecho Inserting System Roles...

select rlm.register_component ( 'SEC', 'ins_system_roles.sql' );

begin;
insert into sec.system_roles ( role_name, description, role_start_date ) values ( 'ref_data_admin', 'Reference Data Administrator', current_date );
insert into sec.system_roles ( role_name, description, role_start_date ) values ( 'party_admin', 'Employee Data Administrator', current_date );
insert into sec.system_roles ( role_name, description, role_start_date ) values ( 'security_admin', 'User Administrator', current_date );
insert into sec.system_roles ( role_name, description, role_start_date ) values ( 'sys_admin', 'Cromby System Administrator', current_date );
commit;

select rlm.component_registered ( 'ins_system_roles.sql' );

\qecho System Roles inserted
