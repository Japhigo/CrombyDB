\qecho Creating BIR trigger for party_relationships

select rlm.register_component ( 'CIN', 'trg_bir_party_relationships.sql' );

create trigger bir_party_relationships before insert on cin.party_relationships
  for each row execute procedure cin.bir_audit();

select rlm.component_registered ( 'trg_bir_party_relationships.sql' );
