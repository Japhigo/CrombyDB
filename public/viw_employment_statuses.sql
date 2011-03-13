\qecho Creating view on employment_statuses

select rlm.register_component ( 'PUB', 'viw_employment_statuses.sql' );

create or replace view public.viw_employment_statuses
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
    from cin.employment_statuses ems join cin.data_statuses das on ems.data_status_code = das.code
   where ems.data_status_code != -1
     and ems.available;

select rlm.component_registered ( 'viw_employment_statuses.sql' );
