\qecho Creating view on party_classifications

select rlm.register_component ( 'PUB', 'viw_party_classifications.sql' );

create or replace view public.viw_party_classifications
as
  select pac.id
        ,pac.code
        ,pac.display
        ,pac.description
        ,pac.created_by
        ,pac.created_date_time
        ,pac.updated_by
        ,pac.updated_date_time
        ,pac.data_status_code
        ,das.description as data_status_desc
    from cin.party_classifications pac join cin.data_statuses das on pac.data_status_code = das.code
   where pac.data_status_code != -1
     and pac.available;

select rlm.component_registered ( 'viw_party_classifications.sql' );
