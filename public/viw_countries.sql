\qecho Creating view on countries

select rlm.register_component ( 'PUB', 'viw_countries.sql' );

create or replace view public.view_countries
as
  select cou.id
        ,cou.code
        ,cou.display
        ,cou.description
        ,cou.created_by
        ,cou.created_date_time
        ,cou.updated_by
        ,cou.updated_date_time
        ,cou.data_status_code
        ,das.description as data_status_desc
    from cin.countries cou join cin.data_statuses das on cou.data_status_code = das.code
   where cou.data_status_code != -1
     and cou.available;

select rlm.component_registered ( 'viw_countries.sql' );
