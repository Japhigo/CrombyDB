\qecho Creating view on party_types

select rlm.register_component ( 'PUB', 'viw_party_types.sql' );

create or replace view public.viw_party_types
as
  select pat.id
        ,pat.code
        ,pat.display
        ,pat.description
        ,pat.created_by
        ,pat.created_at
        ,pat.updated_by
        ,pat.updated_at
        ,pat.data_status_code
        ,das.description as data_status_desc
    from cin.party_types pat join cin.data_statuses das on pat.data_status_code = das.code
   where pat.data_status_code != -1
     and pat.available;

select rlm.component_registered ( 'viw_party_types.sql' );
