\qecho Creating view on occupation_types

select rlm.register_component('PUB', 'viw_occupation_types.sql');

create or replace view public.viw_occupation_types
as
  select oct.id
        ,oct.code
        ,oct.display
        ,oct.description
        ,oct.created_by
        ,oct.created_at
        ,oct.updated_by
        ,oct.updated_at
        ,oct.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.occupation_types oct join cin.data_statuses das on oct.data_status_code = das.code;

select rlm.component_registered('viw_occupation_types.sql');

