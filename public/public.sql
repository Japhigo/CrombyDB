\qecho Installing Public component...

select rlm.register_component('PUB', 'public.sql');

--
-- Tables
--
\i tab_sessions.sql

--
-- Views
--

\i viw_business_types.sql

\i viw_communication_languages.sql

\i viw_contact_point_usage_types.sql

\i viw_countries.sql

\i viw_db_release_components.sql

\i viw_db_releases.sql

\i viw_employment_statuses.sql

\i viw_event_role_types.sql

\i viw_event_statuses.sql

\i viw_event_types.sql

\i viw_flagged_address_reasons.sql

\i viw_genders.sql

\i viw_legal_classifications.sql

\i viw_marital_statuses.sql

\i viw_match_statuses.sql

\i viw_occupation_types.sql

\i viw_party_classifications.sql

\i viw_party_group_types.sql

\i viw_party_role_types.sql

\i viw_party_types.sql

\i viw_postal_address_categories.sql

\i viw_relationship_priorities.sql

\i viw_relationship_statuses.sql

\i viw_relationship_types.sql

\i viw_employees.sql

\i viw_departments.sql

\i viw_users.sql

--
-- Functions
--
\i fnc_authenticate_user.sql

\i fnc_authorize_user.sql

\i fnc_current_version.sql

\i fnc_lock_account.sql

\i fnc_upd_user_password.sql

--
-- Rules
--

select rlm.component_registered('public.sql');

\qecho Public component installed
