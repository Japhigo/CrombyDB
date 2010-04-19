\qecho Inserting Reference Data Table defaults...

select rlm.register_component ( 'CIN', 'ins_ref_data_tables.sql' );

begin;
insert into cin.ref_data_tables ( table_name, code_mandatory, code_min_length, code_max_length, code_format, display_mandatory, description_mandatory)
  values ( 'contact_point_usage_types', false, 0, 0, null, true, false );
insert into cin.ref_data_tables ( table_name, code_mandatory, code_min_length, code_max_length, code_format, display_mandatory, description_mandatory)
  values ( 'employment_statuses', true, 2, 3, null, true, true );
insert into cin.ref_data_tables ( table_name, code_mandatory, code_min_length, code_max_length, code_format, display_mandatory, description_mandatory)
  values ( 'genders', true, 1, 1, null, true, true );
insert into cin.ref_data_tables ( table_name, code_mandatory, code_min_length, code_max_length, code_format, display_mandatory, description_mandatory)
  values ( 'marital_statuses', true, 1, 1, null, true, true );
insert into cin.ref_data_tables ( table_name, code_mandatory, code_min_length, code_max_length, code_format, display_mandatory, description_mandatory)
  values ( 'match_statuses', true, 1, 1, null, true, true );

commit;

select rlm.component_registered ( 'ins_ref_data_tables.sql' );

\qecho Reference Data Table defaults inserted
