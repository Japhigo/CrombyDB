\qecho Creating BIR trigger for legal_classifications

select rlm.register_component ( 'CIN', 'trg_bir_legal_classifications.sql' );

create trigger bir_legal_classifications before insert on cin.legal_classifications
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_legal_classifications.sql' );
