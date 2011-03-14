\qecho Creating view on relationship_statuses

select rlm.register_component('PUB', 'viw_relationship_statuses.sql');

create or replace view public.viw_relationship_statuses
as
  select res.id
        ,res.code
        ,res.display
        ,res.description
        ,res.created_by
        ,res.created_at
        ,res.updated_by
        ,res.updated_at
        ,res.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.relationship_statuses res join cin.data_statuses das on res.data_status_code = das.code;

select rlm.component_registered('viw_relationship_statuses.sql');

