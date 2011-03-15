\qecho Creating view view_db_release_components

select rlm.register_component('PUB', 'viw_db_release_components.sql');

create or replace view public.vw_db_release_components
as
  select id
        ,db_release_id
        ,component_name
        ,installed_by
        ,start_date_time
        ,end_date_time
    from rlm.db_release_components;

select rlm.component_registered('viw_db_release_components.sql');

