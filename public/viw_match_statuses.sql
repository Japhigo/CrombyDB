\qecho Creating view on match_statuses

select rlm.register_component('PUB', 'viw_match_statuses.sql');

create or replace view public.viw_match_statuses
as
  select mat.id
        ,mat.code
        ,mat.display
        ,mat.description
        ,mat.created_by
        ,mat.created_at
        ,mat.updated_by
        ,mat.updated_at
        ,mat.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.match_statuses mat join cin.data_statuses das on mat.data_status_code = das.code;

select rlm.component_registered('viw_match_statuses.sql');

