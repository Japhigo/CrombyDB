\qecho Creating BUR trigger for ref_data_tables

select rlm.register_component ( 'CIN', 'trg_bur_ref_data_tables.sql' );

create trigger bur_ref_data_tables before update on cin.bur_ref_data_tables
  for each row execute procedure cin.bur_audit();

comment on trigger bur_ref_data_tables on cin.bur_ref_data_tables is '@DOCBOOK Before Insert Row to control columns updated and to check audit columns.';

select rlm.component_registered ( 'trg_bur_ref_data_tables.sql' );
