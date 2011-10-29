\qecho Creating BIR trigger for party_object_types

select rlm.register_component('CIN', 'trg_bir_party_object_types.sql');

create trigger bir_party_object_types before insert on cin.party_object_types
  for each row execute procedure cin.bir_audit();

comment on trigger bir_party_object_types on cin.party_object_types is '@DOCBOOK Before Insert Row trigger to populate audit columns.';

select rlm.component_registered('CIN', 'trg_bir_party_object_types.sql');
