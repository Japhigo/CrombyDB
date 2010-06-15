\qecho Creating BIR trigger for parties

select rlm.register_component ( 'CIN', 'trg_bir_parties.sql' );

create trigger bir_parties before insert on cin.parties
  for each row execute procedure cin.bir_audit();

select rlm.component_registered ( 'trg_bir_parties.sql' );
