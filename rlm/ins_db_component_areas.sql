\qecho Inserting DB Component Areas...

begin;
insert into rlm.db_component_areas(component_area_code, description, created_by, created_at, updated_by, updated_at)
  values ('RLM', 'Release Management', session_user, current_timestamp, session_user, current_timestamp);
insert into rlm.db_component_areas(component_area_code, description, created_by, created_at, updated_by, updated_at)
  values ('WKF', 'Workflow', session_user, current_timestamp, session_user, current_timestamp);
insert into rlm.db_component_areas(component_area_code, description, created_by, created_at, updated_by, updated_at)
  values ('SEC', 'Security', session_user, current_timestamp, session_user, current_timestamp);
insert into rlm.db_component_areas(component_area_code, description, created_by, created_at, updated_by, updated_at)
  values ('PUB', 'Public schema objects', session_user, current_timestamp, session_user, current_timestamp);
insert into rlm.db_component_areas(component_area_code, description, created_by, created_at, updated_by, updated_at)
  values ('CIN', 'Customer Intelligence', session_user, current_timestamp, session_user, current_timestamp);
commit;

\qecho DB Component Areas inserted
