\qecho Creating permissions...

select rlm.register_component('CIN', 'cin_grants.sql');

\qecho Assign permissions to ref_data_admin

grant select, insert, update on cin.business_types to ref_data_admin;
grant select, insert, update on cin.communication_languages to ref_data_admin;
grant select, insert, update on cin.contact_point_fail_types to ref_data_admin;
grant select, insert, update on cin.contact_point_usage_types to ref_data_admin;
grant select, insert, update on cin.countries to ref_data_admin;
grant select on cin.data_load_statuses to ref_data_admin;
grant select on cin.data_statuses to ref_data_admin;
grant select, insert, update on cin.employment_statuses to ref_data_admin;
grant select, insert, update on cin.event_role_types to ref_data_admin;	
grant select, insert, update on cin.event_statuses to ref_data_admin;	
grant select, insert, update on cin.event_types to ref_data_admin;	
grant select, insert, update on cin.flagged_address_reasons to ref_data_admin;	
grant select, insert, update on cin.genders to ref_data_admin;
grant select, insert, update on cin.legal_classifications to ref_data_admin;	
grant select, insert, update on cin.marital_statuses to ref_data_admin;
grant select, insert, update on cin.match_statuses to ref_data_admin;
grant select, insert, update on cin.occupation_types to ref_data_admin;	
grant select, insert, update on cin.party_classifications to ref_data_admin;	
grant select, insert, update on cin.party_group_types to ref_data_admin;	
grant select, insert, update on cin.party_role_types to ref_data_admin;	
grant select, insert, update on cin.party_types to ref_data_admin;
grant select, insert, update on cin.postal_address_categories to ref_data_admin;	
grant select, insert, update on cin.ref_data_load_rows to ref_data_admin;
grant select, insert, update on cin.ref_data_loads to ref_data_admin;
grant select, update on cin.ref_data_tables to ref_data_admin;
grant select, insert, update on cin.relationship_priorities to ref_data_admin;
grant select, insert, update on cin.relationship_statuses to ref_data_admin;
grant select, insert, update on cin.relationship_types to ref_data_admin;
grant select, insert, update on cin.telephone_connection_types to ref_data_admin;

\qecho Assign permissions to employee_admin

grant select, insert, update on cin.parties to employee_admin;
grant select, insert, update on cin.party_persons to employee_admin;
grant select, insert, update on cin.party_organisations to employee_admin;
grant select, insert, update on cin.party_role_types to employee_admin;	
grant select, insert, update on cin.party_roles to employee_admin;	
grant select, insert, update on cin.party_relationships to employee_admin;	

select rlm.component_registered('CIN', 'cin_grants.sql');

\qecho Permissions created
