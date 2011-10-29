\qecho Installing Customer Intelligence component...

select rlm.register_component('CIN', 'cin.sql');

\qecho Creating Customer Intelligence schema

create schema cin;
	
comment on schema cin is '@DOCBOOK Customer Intelligence objects.';

--
-- Cromby system tables
--

\i tab_data_statuses.sql

\i tab_data_load_statuses.sql

\i tab_ref_data_tables.sql

\i tab_ref_data_loads.sql

\i tab_ref_data_load_rows.sql

\i tab_party_object_types.sql

--
-- reference data tables
--

\i tab_business_types.sql

\i tab_communication_languages.sql

\i tab_contact_point_usage_types.sql

\i tab_contact_point_fail_types.sql

\i tab_countries.sql

\i tab_employment_statuses.sql

\i tab_event_role_types.sql

\i tab_event_statuses.sql

\i tab_event_types.sql

\i tab_flagged_address_reasons.sql

\i tab_genders.sql

\i tab_legal_classifications.sql

\i tab_marital_statuses.sql

\i tab_match_statuses.sql

\i tab_occupation_types.sql

\i tab_party_classifications.sql

\i tab_party_group_types.sql

\i tab_party_role_types.sql

\i tab_party_types.sql

\i tab_postal_address_categories.sql

\i tab_relationship_priorities.sql

\i tab_relationship_statuses.sql

\i tab_relationship_types.sql

\i tab_telephone_connection_types.sql

--
-- data tables
--

\i tab_postal_addresses.sql

\i tab_flagged_addresses.sql

\i tab_parties.sql

\i tab_party_histories.sql

\i tab_party_groups.sql

\i tab_party_group_histories.sql

\i tab_party_persons.sql

\i tab_party_person_histories.sql

\i tab_party_organisations.sql

\i tab_party_organisation_histories.sql

\i tab_party_roles.sql

\i tab_party_role_histories.sql

\i tab_party_relationships.sql

\i tab_party_relationship_histories.sql

\i tab_events.sql

\i tab_event_logs.sql

\i tab_event_roles.sql

\i tab_contact_point_sets.sql

\i tab_contact_points.sql

\i tab_correspondence_addresses.sql

\i tab_email_addresses.sql

\i tab_fax_numbers.sql

\i tab_telephone_numbers.sql

\i tab_website_addresses.sql

--
-- indexes
--

\i idx_ref_data_tables.sql

--
-- functions
--

\i fnc_calc_data_status_code.sql

\i fnc_trg_bir_audit.sql

\i fnc_trg_bir_data_statuses.sql

\i fnc_trg_bir_ref_data_tables.sql

\i fnc_trg_bur_audit.sql

\i fnc_trg_bur_data_statuses.sql

\i fnc_trg_bur_parties.sql

\i fnc_trg_bur_party_organisations.sql

\i fnc_trg_bur_party_persons.sql

\i fnc_trg_bur_party_groups.sql

\i fnc_trg_bur_party_roles.sql

\i fnc_trg_bur_party_relationships.sql

\i fnc_trg_bur_ref_data_tables.sql

--
-- triggers
--

\i trg_bir_business_types.sql

\i trg_bir_communication_languages.sql

\i trg_bir_contact_point_usage_types.sql

\i trg_bir_countries.sql

\i trg_bir_data_statuses.sql

\i trg_bir_data_load_statuses.sql

\i trg_bir_employment_statuses.sql

\i trg_bir_event_role_types.sql

\i trg_bir_event_statuses.sql

\i trg_bir_event_types.sql

\i trg_bir_flagged_address_reasons.sql

\i trg_bir_genders.sql

\i trg_bir_legal_classifications.sql

\i trg_bir_marital_statuses.sql

\i trg_bir_match_statuses.sql

\i trg_bir_occupation_types.sql

\i trg_bir_party_classifications.sql

\i trg_bir_party_group_types.sql

\i trg_bir_party_role_types.sql

\i trg_bir_party_types.sql

\i trg_bir_postal_address_categories.sql

\i trg_bir_ref_data_tables.sql

\i trg_bir_ref_data_loads.sql

\i trg_bir_ref_data_load_rows.sql

\i trg_bir_relationship_priorities.sql

\i trg_bir_relationship_statuses.sql

\i trg_bir_relationship_types.sql

\i trg_bir_parties.sql

\i trg_bir_party_organisations.sql

\i trg_bir_party_persons.sql

\i trg_bir_party_groups.sql

\i trg_bir_party_roles.sql

\i trg_bir_party_relationships.sql

\i trg_bur_business_types.sql

\i trg_bur_communication_languages.sql

\i trg_bur_contact_point_usage_types.sql

\i trg_bur_countries.sql

\i trg_bur_data_statuses.sql

\i trg_bur_data_load_statuses.sql

\i trg_bur_employment_statuses.sql

\i trg_bur_event_role_types.sql

\i trg_bur_event_statuses.sql

\i trg_bur_event_types.sql

\i trg_bur_flagged_address_reasons.sql

\i trg_bur_genders.sql

\i trg_bur_legal_classifications.sql

\i trg_bur_marital_statuses.sql

\i trg_bur_match_statuses.sql

\i trg_bur_occupation_types.sql

\i trg_bur_party_classifications.sql

\i trg_bur_party_group_types.sql

\i trg_bur_party_role_types.sql

\i trg_bur_party_types.sql

\i trg_bur_postal_address_categories.sql

\i trg_bur_ref_data_tables.sql

\i trg_bur_ref_data_loads.sql

\i trg_bur_ref_data_load_rows.sql

\i trg_bur_relationship_priorities.sql

\i trg_bur_relationship_statuses.sql

\i trg_bur_relationship_types.sql

\i trg_bur_parties.sql

\i trg_bur_party_organisations.sql

\i trg_bur_party_persons.sql

\i trg_bur_party_groups.sql

\i trg_bur_party_roles.sql

\i trg_bur_party_relationships.sql

--
-- data population
--

\i ins_data_statuses.sql

\i ins_data_load_statuses.sql

\i ins_ref_data_tables.sql

\i ins_party_object_types.sql

--\i ins_match_statuses.sql

select rlm.component_registered('CIN', 'cin.sql');

\qecho Customer Intelligence component installed
