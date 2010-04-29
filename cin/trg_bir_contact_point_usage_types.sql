\qecho Creating BIR trigger for contact_point_usage_types

select rlm.register_component ( 'CIN', 'trg_bir_contact_point_usage_types.sql' );

create trigger bir_contact_point_usage_types before insert on cin.contact_point_usage_types
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_contact_point_usage_types.sql' );
