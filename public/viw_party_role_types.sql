\qecho Creating view on party_role_types

select rlm.register_component('PUB', 'viw_party_role_types.sql');

create or replace view public.viw_party_role_types
as
  select prt.id
        ,prt.code
        ,prt.display
        ,prt.description
        ,prt.created_by
        ,prt.created_at
        ,prt.updated_by
        ,prt.updated_at
        ,prt.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.party_role_types prt join cin.data_statuses das on prt.data_status_code = das.code;

select rlm.component_registered('viw_party_role_types.sql');

