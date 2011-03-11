\qecho Un-installing Release Management component...

set search_path to rlm, public;

\qecho Dropping stored function register_release
drop function if exists rlm.register_release();

\qecho Dropping stored function mark_release_complete
drop function if exists rlm.mark_release_complete();

\qecho Dropping stored function current_version
drop function if exists rlm.current_version();

\qecho Dropping stored function register_component
drop function if exists rlm.register_component
  (component_type_code  char(3)
  ,component_name       varchar(255)
  );

\qecho Dropping stored function component_registered
drop function if exists rlm.component_registered (component_name  varchar(255));

\qecho Dropping table db_release_components
drop table if exists rlm.db_release_components cascade;

\qecho Dropping table db_releases
drop table if exists rlm.db_releases cascade;

\qecho Dropping RLM related domains...

\qecho Dropping domain component_type
drop domain if exists component_type;

\qecho RLM related Domains dropped

\qecho Dropping Release Management schema
drop schema if exists rlm cascade;

\qecho Release Management component un-installed
