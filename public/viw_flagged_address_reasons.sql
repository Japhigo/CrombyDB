\qecho Creating view on flagged_address_reasons

select rlm.register_component('PUB', 'viw_flagged_address_reasons.sql');

create or replace view public.viw_flagged_address_reasons
as
  select far.id
        ,far.code
        ,far.display
        ,far.description
        ,far.created_by
        ,far.created_at
        ,far.updated_by
        ,far.updated_at
        ,far.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.flagged_address_reasons far join cin.data_statuses das on far.data_status_code = das.code;

select rlm.component_registered('viw_flagged_address_reasons.sql');

