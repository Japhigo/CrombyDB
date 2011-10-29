\qecho Creating BUR trigger for ref_data_tables

select rlm.register_component('CIN', 'trg_bur_ref_data_tables.sql');

create trigger bur_ref_data_tables before update on cin.ref_data_tables
  for each row execute procedure cin.bur_ref_data_tables();

comment on trigger bur_ref_data_tables on cin.ref_data_tables is '@DOCBOOK Brefore Update Trigger on REF_DATA_TABLES to control columns updated and set audit columns.';

select rlm.component_registered('CIN', 'trg_bur_ref_data_tables.sql');
