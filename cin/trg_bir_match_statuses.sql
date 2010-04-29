\qecho Creating BIR trigger for match_statuses

select rlm.register_component ( 'CIN', 'trg_bir_match_statuses.sql' );

create trigger bir_match_statuses before insert on cin.match_statuses
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_match_statuses.sql' );
