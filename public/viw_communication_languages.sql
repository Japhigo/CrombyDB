\qecho Creating view on communication_languages

select rlm.register_component('PUB', 'viw_communication_languages.sql');

create or replace view public.viw_communication_languages
as
  select col.id
        ,col.code
        ,col.display
        ,col.description
        ,col.created_by
        ,col.created_at
        ,col.updated_by
        ,col.updated_at
        ,col.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.communication_languages col join cin.data_statuses das on col.data_status_code = das.code;

select rlm.component_registered('viw_communication_languages.sql');

