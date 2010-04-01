\qecho Creating BUR trigger for communication_languages

select rlm.register_component ( 'CIN', 'trg_bur_communication_languages.sql' );

create trigger bur_communication_languages before update on cin.communication_languages
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_communication_languages.sql' );
