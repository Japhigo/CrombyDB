\qecho Creating view on event_statuses

select rlm.register_component('PUB', 'viw_event_statuses.sql');

create or replace view public.viw_event_statuses
as
  select evs.id
        ,evs.code
        ,evs.display
        ,evs.description
        ,evs.created_by
        ,evs.created_at
        ,evs.updated_by
        ,evs.updated_at
        ,evs.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.event_statuses evs join cin.data_statuses das on evs.data_status_code = das.code;

select rlm.component_registered('viw_event_statuses.sql');

