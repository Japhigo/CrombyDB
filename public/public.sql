\qecho Installing Public component...

select rlm.register_component ( 'PUB', 'public.sql' );

--
-- Views
--

\i viw_business_types.sql

\i viw_communication_languages.sql

\i viw_contact_point_usage_types.sql

\i viw_countries.sql

\i viw_db_releases.sql

\i viw_db_release_components.sql

\i viw_employment_statuses.sql

\i viw_event_role_types.sql

\i viw_marital_statuses.sql

--
-- Functions
--
\i fnc_current_version.sql

select rlm.component_registered ( 'public.sql' );

\qecho Public component installed
