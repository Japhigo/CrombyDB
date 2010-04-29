\qecho Creating BIR trigger for party_classifications

select rlm.register_component ( 'CIN', 'trg_bir_party_classifications.sql' );

create trigger bir_party_classifications before insert on cin.party_classifications
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_party_classifications.sql' );
