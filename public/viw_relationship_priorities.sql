\qecho Creating view on relationship_priorities

select rlm.register_component ( 'PUB', 'viw_relationship_priorities.sql' );

create or replace view public.viw_relationship_priorities
as
  select rep.id
        ,rep.code
        ,rep.display
        ,rep.description
        ,rep.created_by
        ,rep.created_date_time
        ,rep.updated_by
        ,rep.updated_date_time
        ,rep.data_status_code
        ,das.description as data_status_desc
    from cin.relationship_priorities rep join cin.data_statuses das on rep.data_status_code = das.code
   where rep.data_status_code != -1
     and rep.available;

select rlm.component_registered ( 'viw_relationship_priorities.sql' );
