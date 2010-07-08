\qecho Creating view on event_statuses

select rlm.register_component ( 'PUB', 'viw_event_statuses.sql' );

create or replace view public.viw_event_statuses
as
  select evs.id
        ,evs.code
        ,evs.display
        ,evs.description
        ,evs.created_by
        ,evs.created_date_time
        ,evs.updated_by
        ,evs.updated_date_time
        ,evs.data_status_code
        ,das.description as data_status_desc
    from cin.event_statuses evs join cin.data_statuses das on evs.data_status_code = das.code
   where evs.data_status_code != -1
     and evs.available;

select rlm.component_registered ( 'viw_event_statuses.sql' );
