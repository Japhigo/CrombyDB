\qecho Creating view on event_types

select rlm.register_component ( 'PUB', 'viw_event_types.sql' );

create or replace view public.viw_event_types
as
  select evt.id
        ,evt.code
        ,evt.display
        ,evt.description
        ,evt.created_by
        ,evt.created_at
        ,evt.updated_by
        ,evt.updated_at
        ,evt.data_status_code
        ,das.description as data_status_desc
    from cin.event_types evt join cin.data_statuses das on evt.data_status_code = das.code
   where evt.data_status_code != -1
     and evt.available;

select rlm.component_registered ( 'viw_event_types.sql' );
