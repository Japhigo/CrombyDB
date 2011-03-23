\qecho Creating permissions...

select rlm.register_component('SEC', 'permissions.sql');

\qecho Create role ref_data_admin

create role ref_data_admin nologin inherit;

\qecho Assign permissions to ref_data_admin

grant select, insert, update on cin.business_types to ref_data_admin;
grant select, insert, update on cin.communication_languages to ref_data_admin;
grant select, insert, update on cin.contact_point_usage_types to ref_data_admin;
grant select, insert, update on cin.countries to ref_data_admin;
grant select on cin.data_load_statuses to ref_data_admin;
grant select on cin.data_statuses to ref_data_admin;
grant select, insert, update on cin.employment_statuses to ref_data_admin;
grant select, insert, update on cin.genders to ref_data_admin;
grant select, insert, update on cin.marital_statuses to ref_data_admin;
grant select, insert, update on cin.match_statuses to ref_data_admin;
grant select, update on cin.ref_data_tables to ref_data_admin;

create role employee_admin nologin inherit;
create role security_admin nologin inherit;


create role system_admin nologin inherit;
create role cromby_user nologin inherit;
create role cromby_login nologin inherit;
create role cromby_archivist nologin inherit;
		
select rlm.component_registered('permissions.sql');

\qecho Permissions created
