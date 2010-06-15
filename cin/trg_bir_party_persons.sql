\qecho Creating BIR trigger for party persons

select rlm.register_component ( 'CIN', 'trg_bir_party_persons.sql' );

create trigger bir_party_persons before insert on cin.party_persons
  for each row execute procedure cin.bir_audit();

select rlm.component_registered ( 'trg_bir_party_persons.sql' );
