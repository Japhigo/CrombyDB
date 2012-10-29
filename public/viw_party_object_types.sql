\qecho Creating view on party_object_types

select rlm.register_component('PUB', 'viw_party_object_types.sql');

create or replace view public.vw_party_object_types
as
  select pot.id
        ,pot.party_object_type_code
        ,pot.internal
        ,pot.created_by
        ,pot.created_at
        ,pot.updated_by
        ,pot.updated_at
    from cin.party_object_types pot;

select rlm.component_registered('PUB', 'viw_party_object_types.sql');

