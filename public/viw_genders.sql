\qecho Creating view on genders

select rlm.register_component ( 'PUB', 'viw_genders.sql' );

create or replace view public.viw_genders
as
  select gen.id
        ,gen.code
        ,gen.display
        ,gen.description
        ,gen.created_by
        ,gen.created_date_time
        ,gen.updated_by
        ,gen.updated_date_time
        ,gen.data_status_code
        ,das.description as data_status_desc
    from cin.genders gen join cin.data_statuses das on gen.data_status_code = das.code
   where gen.data_status_code != -1
     and gen.available;

select rlm.component_registered ( 'viw_genders.sql' );
