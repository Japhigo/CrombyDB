\qecho Creating view on party_role_types for maintenance

select rlm.register_component('PUB', 'viw_role_types.sql');

create or replace view public.role_types
as
  select prt.id
        ,prt.display
        ,prt.description
        ,pot.party_object_type_code
        ,pot.internal
        ,prt.effective_from_date
        ,prt.effective_to_date
        ,prt.created_by
        ,prt.created_at
        ,prt.updated_by
        ,prt.updated_at
        ,prt.data_status_code
    from cin.party_role_types prt join cin.party_object_types pot on prt.party_object_type_id = pot.id;

comment on view public.role_types is '@DOCBOOK API View used to maintain Party Roles Types';

select rlm.component_registered('PUB', 'viw_role_types.sql');

