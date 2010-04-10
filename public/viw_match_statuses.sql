\qecho Creating view on match_statuses

select rlm.register_component ( 'PUB', 'viw_match_statuses.sql' );

create or replace view public.view_match_statuses
as
  select mat.id
        ,mat.match_status
        ,mat.description
        ,mat.created_by
        ,mat.created_date_time
        ,mat.updated_by
        ,mat.updated_date_time
        ,mat.data_status_code
        ,das.description as data_status_desc
    from cin.match_statuses mat join cin.data_statuses das on mat.data_status_code = das.code
   where data_status_code != -1;

select rlm.component_registered ( 'viw_match_statuses.sql' );
