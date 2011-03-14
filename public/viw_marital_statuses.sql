\qecho Creating view on marital_statuses

select rlm.register_component('PUB', 'viw_marital_statuses.sql');

create or replace view public.viw_marital_statuses
as
  select mas.id
        ,mas.code
        ,mas.display
        ,mas.description
        ,mas.created_by
        ,mas.created_at
        ,mas.updated_by
        ,mas.updated_at
        ,mas.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.marital_statuses mas join cin.data_statuses das on mas.data_status_code = das.code;

select rlm.component_registered('viw_marital_statuses.sql');

