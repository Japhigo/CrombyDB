\qecho Creating view on occupation_types

select rlm.register_component ( 'PUB', 'viw_occupation_types.sql' );

create or replace view public.viw_occupation_types
as
  select oct.id
        ,oct.code
        ,oct.display
        ,oct.description
        ,oct.created_by
        ,oct.created_date_time
        ,oct.updated_by
        ,oct.updated_date_time
        ,oct.data_status_code
        ,das.description as data_status_desc
    from cin.occupation_types oct join cin.data_statuses das on oct.data_status_code = das.code
   where oct.data_status_code != -1
     and oct.available;

select rlm.component_registered ( 'viw_occupation_types.sql' );
