\qecho Creating BUR trigger for party_object_types

select rlm.register_component('CIN', 'trg_bur_party_object_types.sql');

create trigger bur_party_object_types before update on cin.party_object_types
  for each row execute procedure cin.bur_audit();

comment on trigger bur_party_object_types on cin.party_object_types is '@DOCBOOK Before Update Row trigger to populate audit columns.';

select rlm.component_registered('CIN', 'trg_bur_party_object_types.sql');
