\qecho Creating view on party_role_types

select rlm.register_component('PUB', 'viw_party_role_types.sql');

create or replace view public.vw_party_role_types
as
  select prt.id
        ,prt.code
        ,prt.display
        ,prt.description
        ,prt.created_by
        ,prt.created_at
        ,prt.updated_by
        ,prt.updated_at
        ,prt.data_status_code
        ,das.description as data_status_desc
    from cin.party_role_types prt join cin.data_statuses das on prt.data_status_code = das.code
   where current_date >= prt.effective_from_date
     and current_date <= coalesce(prt.effective_to_date, current_date);

comment on view public.vw_party_role_types is '@DOCBOOK View of current Party Role Types';

select rlm.component_registered('PUB', 'viw_party_role_types.sql');
