\qecho Creating table db_component_areas

create table rlm.db_component_areas
  (id                              serial                 primary key
  ,component_area_code             varchar(3)             not null check(length(component_area_code) > 0)
  ,description                     text                   not null check(length(description) > 0)
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  );

comment on table rlm.db_component_areas is '@DOCBOOK Cromby database component areas.';
comment on column rlm.db_component_areas.id is '@DOCBOOK Unique identifier for row.';
comment on column rlm.db_component_areas.component_area_code is '@DOCBOOK Three letter code for the component area.';
comment on column rlm.db_component_areas.description is '@DOCBOOK Description of the component area.';
comment on column rlm.db_component_areas.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column rlm.db_component_areas.created_at is '@DOCBOOK Date and time the record was created.';
comment on column rlm.db_component_areas.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column rlm.db_component_areas.updated_at is '@DOCBOOK Date and time the record was last updated.';

