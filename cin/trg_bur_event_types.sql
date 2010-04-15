\qecho Creating BUR trigger for event_types

select rlm.register_component ( 'CIN', 'trg_bur_event_types.sql' );

create trigger bur_event_types before update on cin.event_types
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_event_types.sql' );
