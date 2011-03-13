\qecho Creating view on match_statuses

select rlm.register_component ( 'PUB', 'viw_match_statuses.sql' );

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
    from cin.match_statuses mat join cin.data_statuses das on mat.data_status_code = das.code
   where mat.data_status_code != -1
     and mat.available;

select rlm.component_registered ( 'viw_match_statuses.sql' );
