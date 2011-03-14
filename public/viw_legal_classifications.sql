\qecho Creating view on legal_classifications

select rlm.register_component('PUB', 'viw_legal_classifications.sql');

create or replace view public.viw_legal_classifications
as
  select lec.id
        ,lec.code
        ,lec.display
        ,lec.description
        ,lec.created_by
        ,lec.created_at
        ,lec.updated_by
        ,lec.updated_at
        ,lec.data_status_code
        ,das.description as data_status_desc
        ,case when current_date between effective_from_date and coalesce(effective_to_date, current_date) then true
           else false
         end as available
    from cin.legal_classifications lec join cin.data_statuses das on lec.data_status_code = das.code;

select rlm.component_registered('viw_legal_classifications.sql');

