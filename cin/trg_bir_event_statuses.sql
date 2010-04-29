\qecho Creating BIR trigger for event_statuses

select rlm.register_component ( 'CIN', 'trg_bir_event_statuses.sql' );

create trigger bir_event_statuses before insert on cin.event_statuses
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_event_statuses.sql' );
