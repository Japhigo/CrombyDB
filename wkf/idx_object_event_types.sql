\qecho Creating indexes on object_event_types

select rlm.register_component ('WKF', 'idx_object_event_types.sql');

create unique index object_event_types_object_event_code_idx on wkf.object_event_types(upper(object_event_code));

comment on index wkf.object_event_types_object_event_code_idx is '@DOCBOOK Index to enforce uniqueness of OBJECT_EVENT_TYPES.EVENT_TYPE_CODE.';

select rlm.component_registered('CIN', 'idx_object_event_types.sql');
