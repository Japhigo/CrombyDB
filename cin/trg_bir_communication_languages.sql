\qecho Creating BIR trigger for communication_languages

select rlm.register_component ( 'CIN', 'trg_bir_communication_languages.sql' );

create trigger bir_communication_languages before insert on cin.communication_languages
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_communication_languages.sql' );
