\echo Creating rule ins_role_type

select rlm.register_component('PUB', 'rul_ins_role_type.sql');

create or replace rule ins_role_type_rule as on insert to public.role_types
do instead
  select public.ins_party_role_type_api
    (new.display
    ,new.description
    ,new.party_object_type_code
    ,new.internal
    ,new.effective_from_date
    ,new.effective_to_date
    ,new.created_by
    ,new.created_at
    ,new.updated_by
    ,new.updated_at
  );

comment on rule ins_role_type_rule on public.role_types is '@DOCBOOK Rule to enable API Insert on ROLE_TYPES view.';

select rlm.component_registered('PUB', 'rul_ins_role_type.sql');
