\qecho Creating BUR trigger for event_role_types

select rlm.register_component ( 'CIN', 'trg_bur_event_role_types.sql' );

create trigger bur_event_role_types before update on cin.event_role_types
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_event_role_types.sql' );
