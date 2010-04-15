\qecho Installing Customer Intelligence component...

select rlm.register_component ( 'CIN', 'cin.sql' );

\qecho Creating Customer Intelligence schema

create schema cin;
	
--
-- Domains
--

\i dom_address_format_type.sql

\i dom_contact_point_object_type.sql

\i dom_party_object_type.sql

\i dom_role_int_ext_type.sql

--
-- Cromby system tables
--

\i tab_data_statuses.sql

\i tab_ref_data_tables.sql

\i tab_ref_data_loads.sql

\i tab_ref_data_load_rows.sql

--
-- reference data tables
--

\i tab_business_types.sql

\i tab_communication_languages.sql

\i tab_contact_point_usage_types.sql

\i tab_countries.sql

\i tab_employment_statuses.sql

\i tab_event_role_types

\i tab_event_statuses

\i tab_event_types

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

--
-- data tables
--

--\i tab_postal_addresses.sql

--\i tab_flagged_addresses.sql

--\i tab_parties.sql

--\i tab_party_groups.sql

--\i tab_party_persons.sql

--\i tab_party_organisations.sql

--\i tab_party_roles.sql

--\i tab_party_relationships.sql

--\i tab_events.sql

--\i tab_event_roles.sql

--\i tab_contact_point_sets.sql

--\i tab_contact_points.sql

--\i tab_correspondence_addresses.sql

--\i tab_email_addresses.sql

--\i tab_fax_numbers.sql

--\i tab_telephone_numbers.sql

--\i tab_website_addresses.sql

--
-- indexes
--

\i idx_ref_data_tables.sql

--
-- functions
--

\i fnc_trg_bur_data_statuses.sql

--
-- triggers
--

\i trg_business_types.sql

\i trg_communication_languages.sql

\i trg_contact_point_usage_types.sql

\i trg_countries.sql

\i trg_employment_statuses.sql

\i trg_event_role_types

\i trg_event_statuses

\i trg_event_types

\i trg_flagged_address_reasons.sql

\i trg_genders.sql

\i trg_legal_classifications.sql

\i trg_marital_statuses.sql

\i trg_match_statuses.sql

\i trg_occupation_types.sql

\i trg_party_classifications.sql

\i trg_party_group_types.sql

\i trg_party_role_types.sql

\i trg_party_types.sql

\i trg_postal_address_categories.sql

\i trg_relationship_priorities.sql

\i trg_relationship_statuses.sql

\i trg_relationship_types.sql

--
-- data population
--

\i ins_data_statuses.sql

\i ins_ref_data_tables.sql

/*
\i ins_business_types.sql

\i ins_communication_languages.sql

\i ins_contact_point_usage_types.sql

\i ins_countries.sql

\i ins_employment_statuses.sql

\i ins_event_role_types.sql
*/
\i ins_genders.sql
/*
\i ins_marital_statuses.sql

\i ins_match_statuses.sql
*/
--
-- Database comments
--

\i doc_cin.sql

select rlm.component_registered ( 'cin.sql' );

\qecho Customer Intelligence component installed
