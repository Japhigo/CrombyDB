\qecho Creating view on party_group_types

select rlm.register_component('PUB', 'viw_party_group_types.sql');

create or replace view public.vw_party_group_types
as
  select pgt.id
        ,pgt.code
        ,pgt.display
        ,pgt.description
        ,pgt.created_by
        ,pgt.created_at
        ,pgt.updated_by
        ,pgt.updated_at
        ,pgt.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.party_group_types pgt join cin.data_statuses das on pgt.data_status_code = das.code;

select rlm.component_registered('viw_party_group_types.sql');

