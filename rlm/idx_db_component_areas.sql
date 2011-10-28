\qecho Creating indexes on db_component_areas

create unique index db_component_areas_component_area_code_idx on rlm.db_component_areas(lower(component_area_code));

comment on rlm.db_component_areas_component_area_code_idx is '@DOCBOOK Index to enforce uniqueness of DB_COMPONENT_AREAS.COMPONENT_AREA_CODE.';
