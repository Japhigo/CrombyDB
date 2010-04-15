\qecho Installing Release Management component...

\qecho Creating Release Management schema

create schema rlm;
	
\i dom_component_type.sql

\i tab_db_releases.sql

\i fnc_register_release.sql

\echo Registering the release

select rlm.register_release();

\i tab_db_release_components.sql

\i fnc_register_component.sql

\i fnc_mark_release_complete.sql

\i fnc_component_registered.sql

\qecho Release Management component installed
