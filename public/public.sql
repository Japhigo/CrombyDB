\qecho Installing Public component...

select rlm.register_component ( 'PUB', 'public.sql' );

--
-- Views
--

\i viw_business_types.sql

\i viw_marital_statuses.sql

\i viw_communication_languages.sql

select rlm.component_registered ( 'public.sql' );

\qecho Public component installed
