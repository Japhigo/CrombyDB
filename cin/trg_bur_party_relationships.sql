\qecho Creating BUR trigger for party_relationships

select rlm.register_component ( 'CIN', 'trg_bur_party_relationships.sql' );

create trigger bur_party_relationships before update on cin.party_relationships
  for each row execute procedure cin.bur_party_relationships();

select rlm.component_registered ( 'trg_bur_party_relationships.sql' );
