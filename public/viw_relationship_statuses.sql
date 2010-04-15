\qecho Creating view on relationship_statuses

select rlm.register_component ( 'PUB', 'viw_relationship_statuses.sql' );

create or replace view public.view_relationship_statuses
as
  select res.id
        ,res.code
        ,res.display
        ,res.description
        ,res.created_by
        ,res.created_date_time
        ,res.updated_by
        ,res.updated_date_time
        ,res.data_status_code
        ,das.description as data_status_desc
    from cin.relationship_statuses res join cin.data_statuses das on res.data_status_code = das.code
   where res.data_status_code != -1
     and res.available;

select rlm.component_registered ( 'viw_relationship_statuses.sql' );
