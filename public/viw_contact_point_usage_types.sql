\qecho Creating view on contact_point_usage_types

select rlm.register_component('PUB', 'viw_contact_point_usage_types.sql');

create or replace view public.vw_contact_point_usage_types
as
  select cpu.id
        ,cpu.code
        ,cpu.display
        ,cpu.description
        ,cpu.created_by
        ,cpu.created_at
        ,cpu.updated_by
        ,cpu.updated_at
        ,cpu.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.contact_point_usage_types cpu join cin.data_statuses das on cpu.data_status_code = das.code;

select rlm.component_registered('viw_contact_point_usage_types.sql');

