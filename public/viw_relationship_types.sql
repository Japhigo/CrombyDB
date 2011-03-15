\qecho Creating view on relationship_types

select rlm.register_component('PUB', 'viw_relationship_types.sql');

create or replace view public.vw_relationship_types
as
  select ret.id
        ,ret.code
        ,ret.display
        ,ret.description
        ,ret.created_by
        ,ret.created_at
        ,ret.updated_by
        ,ret.updated_at
        ,ret.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.relationship_types ret join cin.data_statuses das on ret.data_status_code = das.code;

select rlm.component_registered('viw_relationship_types.sql');

