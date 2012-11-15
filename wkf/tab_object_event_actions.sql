\qecho Creating table object_event_actions

select rlm.register_component('WKF', 'tab_object_event_actions.sql');

create table wkf.object_event_actions
  (id                              serial                 primary key
  ,object_event_type_id            int                    references wkf.object_event_types(id)
  ,summary                         varchar(30)            not null check(length(summary) > 0)
  ,description                     varchar(255)
  ,event_action                    text                   not null check(length(event_action) > 0)
  ,created_by                      varchar(30)            not null check(length(created_by) > 0)
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null check(length(created_by) > 0)
  ,updated_at                      timestamp              not null
  );

comment on table wkf.object_event_actions is '@DOCBOOK Actions to be executed when an object event occurs.';
comment on column wkf.object_event_actions.id is '@DOCBOOK Unique identifier for row.';
comment on column wkf.object_event_actions.object_event_type_id is '@DOCBOOK Foreign key to <link linkend="wkf-table-object_event_types">OBJECT_EVENT_TYPES.</link>';
comment on column wkf.object_event_actions.summary is '@DOCBOOK Short description of the action.';
comment on column wkf.object_event_actions.description is '@DOCBOOK Free format description of the action.';
comment on column wkf.object_event_actions.event_action is '@DOCBOOK Code to execute.';
comment on column wkf.object_event_actions.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column wkf.object_event_actions.created_at is '@DOCBOOK Date and time the record was created.';
comment on column wkf.object_event_actions.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column wkf.object_event_actions.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('WKF', 'tab_object_event_actions.sql');
