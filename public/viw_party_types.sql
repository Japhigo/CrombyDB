\qecho Creating view on party_types

select rlm.register_component('PUB', 'viw_party_types.sql');

create or replace view public.vw_party_types
as
  select pat.id
        ,pat.code
        ,pat.display
        ,pat.description
        ,pat.created_by
        ,pat.created_at
        ,pat.updated_by
        ,pat.updated_at
        ,pat.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.party_types pat join cin.data_statuses das on pat.data_status_code = das.code;

select rlm.component_registered('viw_party_types.sql');

