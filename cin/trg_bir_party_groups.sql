\qecho Creating BIR trigger for party_groups

select rlm.register_component ( 'CIN', 'trg_bir_party_groups.sql' );

create trigger bir_parties before insert on cin.party_groups
  for each row execute procedure cin.bir_audit();

select rlm.component_registered ( 'trg_bir_party_groups.sql' );
