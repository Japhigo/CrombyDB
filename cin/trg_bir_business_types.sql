\qecho Creating BIR trigger for business_types

select rlm.register_component ( 'CIN', 'trg_bir_business_types.sql' );

create trigger bir_business_types before insert on cin.business_types
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_business_types.sql' );
