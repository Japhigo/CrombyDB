\qecho Inserting System Roles...

select rlm.register_component ( 'SEC', 'ins_system_roles.sql' );

begin;
insert into sec.system_roles ( role_name, description, role_start_date ) values ( '', '', current_date );
commit;

select rlm.component_registered ( 'ins_system_roles.sql' );

\qecho System Roles inserted
