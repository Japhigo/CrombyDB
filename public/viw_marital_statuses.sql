\qecho Creating view on marital_statuses

select rlm.register_component ( 'PUB', 'viw_marital_statuses.sql' );

create or replace view public.view_marital_statuses
as
  select mas.id
        ,mas.code
        ,mas.display
        ,mas.description
        ,mas.created_by
        ,mas.created_date_time
        ,mas.updated_by
        ,mas.updated_date_time
        ,mas.data_status_code
        ,das.description as data_status_desc
    from cin.marital_statuses mas join cin.data_statuses das on mas.data_status_code = das.code
   where mas.data_status_code != -1
     and mas.available;

select rlm.component_registered ( 'viw_marital_statuses.sql' );
