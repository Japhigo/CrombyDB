\qecho Creating BUR trigger for marital_statuses

select rlm.register_component ( 'CIN', 'trg_bur_business_types.sql' );

create trigger bur_business_types before update on cin.business_types
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_business_types.sql' );
