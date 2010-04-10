\qecho Creating BUR trigger for match_statuses

select rlm.register_component ( 'CIN', 'trg_bur_match_statuses.sql' );

create trigger bur_match_statuses before update on cin.match_statuses
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_match_statuses.sql' );
