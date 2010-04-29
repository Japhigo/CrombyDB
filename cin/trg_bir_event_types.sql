\qecho Creating BIR trigger for event_types

select rlm.register_component ( 'CIN', 'trg_bir_event_types.sql' );

create trigger bir_event_types before insert on cin.event_types
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_event_types.sql' );
