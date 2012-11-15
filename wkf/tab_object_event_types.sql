\qecho Creating table object_event_types

select rlm.register_component('WKF', 'tab_object_event_types.sql');

create table wkf.object_event_types
  (id                              serial                 primary key
  ,object_event_code               varchar(30)            not null check(length(object_event_code) > 0)
  ,description                     varchar(255)
  ,created_by                      varchar(30)            not null check(length(created_by) > 0)
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null check(length(created_by) > 0)
  ,updated_at                      timestamp              not null
  );

comment on table wkf.object_event_types is '@DOCBOOK Object Event definitions.';
comment on column wkf.object_event_types.id is '@DOCBOOK Unique identifier for row.';
comment on column wkf.object_event_types.object_event_code is '@DOCBOOK Code to indicate the event that occurred.';
comment on column wkf.object_event_types.description is '@DOCBOOK Free format description of the event.';
comment on column wkf.object_event_types.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column wkf.object_event_types.created_at is '@DOCBOOK Date and time the record was created.';
comment on column wkf.object_event_types.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column wkf.object_event_types.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('WKF', 'tab_object_event_types.sql');
