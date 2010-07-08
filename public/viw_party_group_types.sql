\qecho Creating view on party_group_types

select rlm.register_component ( 'PUB', 'viw_party_group_types.sql' );

create or replace view public.viw_party_group_types
as
  select pgt.id
        ,pgt.code
        ,pgt.display
        ,pgt.description
        ,pgt.created_by
        ,pgt.created_date_time
        ,pgt.updated_by
        ,pgt.updated_date_time
        ,pgt.data_status_code
        ,das.description as data_status_desc
    from cin.party_group_types pgt join cin.data_statuses das on pgt.data_status_code = das.code
   where pgt.data_status_code != -1
     and pgt.available;

select rlm.component_registered ( 'viw_party_group_types.sql' );
