\qecho Creating view on event_role_types

select rlm.register_component( 'PUB', 'viw_event_role_types.sql');

create or replace view public.vw_event_role_types
as
  select ert.id
        ,ert.code
        ,ert.display
        ,ert.description
        ,ert.created_by
        ,ert.created_at
        ,ert.updated_by
        ,ert.updated_at
        ,ert.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.event_role_types ert join cin.data_statuses das on ert.data_status_code = das.code;

select rlm.component_registered('viw_event_role_types.sql');

