\echo Creating function trg_party_role_type_api

select rlm.register_component('PUB', 'trg_party_role_type_api.sql');

create trigger trg_party_role_type_api instead of insert or update or delete on public.role_types
  for each row execute procedure public.trg_party_role_type_api();

comment on trigger trg_party_role_type_api on public.role_types is '@DOCBOOK API Trigger to insert, update, or delete a Party Role Type.';

select rlm.component_registered('PUB', 'trg_party_role_type_api.sql');
