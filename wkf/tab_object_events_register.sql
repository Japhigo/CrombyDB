\qecho Creating table object_events_register

select rlm.register_component('WKF', 'tab_object_events_register.sql');

create table wkf.object_events_register
  (id                              serial                 primary key
  ,object_table_name               varchar(255)           not null check(length(object_table_name) > 0)
  ,object_id                       int                    not null
  ,object_event_code               varchar(255)           not null check(length(object_event_code) > 0)
  ,object_event_data               text
  ,processed                       boolean                not null
  ,created_at                      timestamp              not null
  );

comment on table wkf.object_events_register is '@DOCBOOK Object Events Register to hold events triggering workflow items.';
comment on column wkf.object_events_register.id is '@DOCBOOK Unique identifier for row.';
comment on column wkf.object_events_register.object_table_name is '@DOCBOOK table name of the triggering object.';
comment on column wkf.object_events_register.object_id is '@DOCBOOK Unique identifier of the triggering object.';
comment on column wkf.object_events_register.object_event_code is '@DOCBOOK Code to indicate the event the occurred.';
comment on column wkf.object_events_register.object_event_data is '@DOCBOOK Optional data relating to the event.';
comment on column wkf.object_events_register.processed is '@DOCBOOK Indicates if the object event has been processed by the workflow system.';
comment on column wkf.object_events_register.created_at is '@DOCBOOK Date and time the record was last created.';

select rlm.component_registered('WKF', 'tab_object_events_register.sql');
