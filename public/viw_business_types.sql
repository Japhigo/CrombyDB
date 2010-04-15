\qecho Creating view on business_types

select rlm.register_component ( 'PUB', 'viw_business_types.sql' );

create or replace view public.view_business_types
as
  select but.id
        ,but.code
        ,but.display
        ,but.description
        ,but.created_by
        ,but.created_date_time
        ,but.updated_by
        ,but.updated_date_time
        ,but.data_status_code
        ,das.description as data_status_desc
    from cin.business_types but join cin.data_statuses das on but.data_status_code = das.code
   where but.data_status_code != -1
     and but.available;

select rlm.component_registered ( 'viw_business_types.sql' );
