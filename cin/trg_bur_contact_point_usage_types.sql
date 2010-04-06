\qecho Creating BUR trigger for contact_point_usage_types

select rlm.register_component ( 'CIN', 'trg_bur_contact_point_usage_types.sql' );

create trigger bur_contact_point_usage_types before update on cin.contact_point_usage_types
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_contact_point_usage_types.sql' );
