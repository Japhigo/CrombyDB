\qecho Creating BUR trigger for legal_classifications

select rlm.register_component ( 'CIN', 'trg_bur_legal_classifications.sql' );

create trigger bur_legal_classifications before update on cin.legal_classifications
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_legal_classifications.sql' );
