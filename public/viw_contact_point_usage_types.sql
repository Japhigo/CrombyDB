\qecho Creating view on contact_point_usage_types

select rlm.register_component ( 'PUB', 'viw_contact_point_usage_types.sql' );

create or replace view public.view_contact_point_usage_types
as
  select cpu.id
        ,cpu.code
        ,cpu.display
        ,cpu.description
        ,cpu.created_by
        ,cpu.created_date_time
        ,cpu.updated_by
        ,cpu.updated_date_time
        ,cpu.data_status_code
        ,das.description as data_status_desc
    from cin.contact_point_usage_types cpu join cin.data_statuses das on cpu.data_status_code = das.code
   where cpu.data_status_code != -1
     and cpu.available;

select rlm.component_registered ( 'viw_contact_point_usage_types.sql' );
