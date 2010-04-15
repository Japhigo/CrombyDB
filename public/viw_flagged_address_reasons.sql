\qecho Creating view on flagged_address_reasons

select rlm.register_component ( 'PUB', 'viw_flagged_address_reasons.sql' );

create or replace view public.view_flagged_address_reasons
as
  select far.id
        ,far.code
        ,far.display
        ,far.description
        ,far.created_by
        ,far.created_date_time
        ,far.updated_by
        ,far.updated_date_time
        ,far.data_status_code
        ,das.description as data_status_desc
    from cin.flagged_address_reasons far join cin.data_statuses das on far.data_status_code = das.code
   where far.data_status_code != -1
     and far.available;

select rlm.component_registered ( 'viw_flagged_address_reasons.sql' );
