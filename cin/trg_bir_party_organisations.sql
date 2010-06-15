\qecho Creating BIR trigger for party organisations

select rlm.register_component ( 'CIN', 'trg_bir_party_organisations.sql' );

create trigger bir_party_organisations before insert on cin.party_organisations
  for each row execute procedure cin.bir_audit();

select rlm.component_registered ( 'trg_bir_party_organisations.sql' );
