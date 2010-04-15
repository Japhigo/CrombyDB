\qecho Creating BUR trigger for event_statuses

select rlm.register_component ( 'CIN', 'trg_bur_event_statuses.sql' );

create trigger bur_event_statuses before update on cin.event_statuses
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_event_statuses.sql' );
