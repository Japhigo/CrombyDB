\qecho Creating BUR trigger for party_classifications

select rlm.register_component ( 'CIN', 'trg_bur_party_classifications.sql' );

create trigger bur_party_classifications before update on cin.party_classifications
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_party_classifications.sql' );
