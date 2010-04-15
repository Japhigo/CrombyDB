\qecho Creating view on party_role_types

select rlm.register_component ( 'PUB', 'viw_party_role_types.sql' );

create or replace view public.view_party_role_types
as
  select prt.id
        ,prt.code
        ,prt.display
        ,prt.description
        ,prt.created_by
        ,prt.created_date_time
        ,prt.updated_by
        ,prt.updated_date_time
        ,prt.data_status_code
        ,das.description as data_status_desc
    from cin.party_role_types prt join cin.data_statuses das on prt.data_status_code = das.code
   where prt.data_status_code != -1
     and prt.available;

select rlm.component_registered ( 'viw_party_role_types.sql' );
