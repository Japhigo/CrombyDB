\qecho Creating view on postal_address_categories

select rlm.register_component('PUB', 'viw_postal_address_categories.sql');

create or replace view public.viw_postal_address_categories
as
  select poc.id
        ,poc.code
        ,poc.display
        ,poc.description
        ,poc.created_by
        ,poc.created_at
        ,poc.updated_by
        ,poc.updated_at
        ,poc.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.postal_address_categories poc join cin.data_statuses das on poc.data_status_code = das.code;

select rlm.component_registered('viw_postal_address_categories.sql');

