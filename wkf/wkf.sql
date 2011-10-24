\qecho Installing Workflow component...

select rlm.register_component('WKF', 'wkf.sql');

\qecho Creating Workflow schema

create schema wkf;
	
comment on schema wkf is '@DOCBOOK Workflow objects.';
	
--
-- Tables
--

--
-- functions
--
\i fnc_register_object_event.sql

--
-- triggers
--

--
-- data population
--


--
-- grants
--

select rlm.component_registered('WKF', 'wkf.sql');

\qecho Workflow component installed
