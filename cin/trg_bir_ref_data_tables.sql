\qecho Creating BIR trigger for ref_data_tables

select rlm.register_component ( 'CIN', 'trg_bir_ref_data_tables.sql' );

create trigger bir_ref_data_tables before insert on cin.ref_data_tables
  for each row execute procedure cin.bir_ref_data_tables();

select rlm.component_registered ( 'trg_bir_ref_data_tables.sql' );
