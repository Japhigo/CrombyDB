\qecho Creating BIR trigger for party_roles

select rlm.register_component ( 'CIN', 'trg_bir_party_roles.sql' );

create trigger bir_party_roles before insert on cin.party_roles
  for each row execute procedure cin.bir_audit();

select rlm.component_registered ( 'trg_bir_party_roles.sql' );
