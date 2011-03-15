\qecho Creating view on employment_statuses

select rlm.register_component('PUB', 'viw_employment_statuses.sql');

create or replace view public.vw_employment_statuses
as
  select ems.id
        ,ems.code
        ,ems.display
        ,ems.description
        ,ems.created_by
        ,ems.created_at
        ,ems.updated_by
        ,ems.updated_at
        ,ems.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.employment_statuses ems join cin.data_statuses das on ems.data_status_code = das.code;

select rlm.component_registered('viw_employment_statuses.sql');

