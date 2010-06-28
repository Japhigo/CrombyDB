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
\i fnc_trg_bir_users.sql

\i fnc_trg_sec_audit.sql

--
-- triggers
--
\i trg_bir_users.sql

--
-- data population
--
\i ins_system_roles.sql
 
--
-- Database comments
--

--\i doc_sec.sql

select rlm.component_registered ( 'sec.sql' );

\qecho Security component installed
