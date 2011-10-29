\qecho Creating BIR trigger for ref_data_tables

select rlm.register_component('CIN', 'trg_bir_ref_data_tables.sql');

create trigger bir_ref_data_tables before insert on cin.ref_data_tables
  for each row execute procedure cin.bir_ref_data_tables();

comment on trigger bir_ref_data_tables on cin.ref_data_tables is '@DOCBOOK Before Insert Row trigger on REF_DATA_TABLES to check audit columns and set default values.';

select rlm.component_registered('CIN', 'trg_bir_ref_data_tables.sql');
