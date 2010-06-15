\qecho Creating BUR trigger for party organisations

select rlm.register_component ( 'CIN', 'trg_bur_party_persons.sql' );

create trigger bur_party_persons before update on cin.party_persons
  for each row execute procedure cin.bur_party_persons();

select rlm.component_registered ( 'trg_bur_party_persons.sql' );
