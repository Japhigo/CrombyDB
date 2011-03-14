\qecho Creating view on genders

select rlm.register_component('PUB', 'viw_genders.sql');

create or replace view public.vw_genders
as
  select gen.id
        ,gen.code
        ,gen.display
        ,gen.description
        ,gen.effective_from_date
        ,gen.effective_to_date
        ,gen.created_by
        ,gen.created_at
        ,gen.updated_by
        ,gen.updated_at
        ,gen.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.genders gen join cin.data_statuses das on gen.data_status_code = das.code;

select rlm.component_registered('viw_genders.sql');
