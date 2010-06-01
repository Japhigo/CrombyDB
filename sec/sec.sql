\qecho Installing Security component...

select rlm.register_component ( 'SEC', 'sec.sql' );

\qecho Creating Security schema

create schema sec;
	
--
-- Domains
--

--
-- Tables
--
\i tab_users.sql

\i tab_system_roles.sql

\i tab_user_roles.sql

\i tab_default_roles.sql

--
-- indexes
--
\i idx_users.sql

--
-- functions
--

--
-- triggers
--

--
-- data population
--


--
-- Database comments
--

--\i doc_sec.sql

select rlm.component_registered ( 'sec.sql' );

\qecho Security component installed
