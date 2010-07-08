\qecho Creating view on postal_address_categories

select rlm.register_component ( 'PUB', 'viw_postal_address_categories.sql' );

create or replace view public.viw_postal_address_categories
as
  select poc.id
        ,poc.code
        ,poc.display
        ,poc.description
        ,poc.created_by
        ,poc.created_date_time
        ,poc.updated_by
        ,poc.updated_date_time
        ,poc.data_status_code
        ,das.description as data_status_desc
    from cin.postal_address_categories poc join cin.data_statuses das on poc.data_status_code = das.code
   where poc.data_status_code != -1
     and poc.available;

select rlm.component_registered ( 'viw_postal_address_categories.sql' );
