\qecho Creating indexes on ref_data_tables

select rlm.register_component ('CIN', 'idx_ref_data_tables.sql');

create unique index ref_data_tables_table_name_idx on cin.ref_data_tables(lower(table_name));

select rlm.component_registered('idx_ref_data_tables.sql');
