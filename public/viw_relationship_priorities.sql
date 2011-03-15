\qecho Creating view on relationship_priorities

select rlm.register_component('PUB', 'viw_relationship_priorities.sql');

create or replace view public.vw_relationship_priorities
as
  select rep.id
        ,rep.code
        ,rep.display
        ,rep.description
        ,rep.created_by
        ,rep.created_at
        ,rep.updated_by
        ,rep.updated_at
        ,rep.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.relationship_priorities rep join cin.data_statuses das on rep.data_status_code = das.code;

select rlm.component_registered('viw_relationship_priorities.sql');

