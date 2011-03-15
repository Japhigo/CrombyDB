\qecho Creating view on party_classifications

select rlm.register_component('PUB', 'viw_party_classifications.sql');

create or replace view public.vw_party_classifications
as
  select pac.id
        ,pac.code
        ,pac.display
        ,pac.description
        ,pac.created_by
        ,pac.created_at
        ,pac.updated_by
        ,pac.updated_at
        ,pac.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.party_classifications pac join cin.data_statuses das on pac.data_status_code = das.code;

select rlm.component_registered('viw_party_classifications.sql');

