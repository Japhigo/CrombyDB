\qecho Creating BIR trigger for event_role_types

select rlm.register_component ( 'CIN', 'trg_bir_event_role_types.sql' );

create trigger bir_event_role_types before insert on cin.event_role_types
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_event_role_types.sql' );
