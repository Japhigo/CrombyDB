\qecho Creating indexes on ref_data_tables

select rlm.register_component ('CIN', 'idx_ref_data_tables.sql');

create unique index ref_data_tables_table_name_idx on cin.ref_data_tables(lower(table_name));

comment on index rlm.ref_data_tables_table_name_idx is '@DOCBOOK Index to enforce uniqueness of REF_DATA_TABLES.TABLE_NAME.';

select rlm.component_registered('CIN', 'idx_ref_data_tables.sql');
