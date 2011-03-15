\qecho Creating view on event_types

select rlm.register_component('PUB', 'viw_event_types.sql');

create or replace view public.vw_event_types
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
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.event_types evt join cin.data_statuses das on evt.data_status_code = das.code;

select rlm.component_registered('viw_event_types.sql');

