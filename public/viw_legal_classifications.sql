\qecho Creating view on legal_classifications

select rlm.register_component ( 'PUB', 'viw_legal_classifications.sql' );

create or replace view public.view_legal_classifications
as
  select lec.id
        ,lec.code
        ,lec.display
        ,lec.description
        ,lec.created_by
        ,lec.created_date_time
        ,lec.updated_by
        ,lec.updated_date_time
        ,lec.data_status_code
        ,das.description as data_status_desc
    from cin.legal_classifications lec join cin.data_statuses das on lec.data_status_code = das.code
   where lec.data_status_code != -1
     and lec.available;

select rlm.component_registered ( 'viw_legal_classifications.sql' );
