\qecho Creating BUR trigger for ref_data_tables

select rlm.register_component ( 'CIN', 'trg_bur_ref_data_tables.sql' );

create trigger bur_ref_data_tables before update on cin.ref_data_tables
  for each row execute procedure cin.bur_audit();

select rlm.component_registered ( 'trg_bur_ref_data_tables.sql' );
