\qecho Creating view on communication_languages

select rlm.register_component ( 'PUB', 'viw_communication_languages.sql' );

create or replace view public.view_communication_languages
as
  select col.id
        ,col.code_a3b
        ,col.code_a3t
        ,col.code_a2
        ,col.english_name
        ,col.french_name
        ,col.used_flag
        ,col.created_by
        ,col.created_date_time
        ,col.updated_by
        ,col.updated_date_time
        ,col.data_status_code
        ,das.description as data_status_desc
    from cin.communication_languages col join cin.data_statuses das on col.data_status_code = das.code
   where data_status_code != -1;

select rlm.component_registered ( 'viw_communication_languages.sql' );
