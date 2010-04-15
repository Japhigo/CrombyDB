\qecho Inserting Reference Data Table defaults...

select rlm.register_component ( 'CIN', 'ins_ref_data_tables.sql' );

begin;
insert into cin.ref_data_tables ( table_name, code_mandatory, code_min_length, code_max_length, code_format, display_mandatory, description_mandatory)
  values ( 'CONTACT_POINT_USAGE_TYPES', false, 0, 0, null, true, false );
insert into cin.ref_data_tables ( table_name, code_mandatory, code_min_length, code_max_length, code_format, display_mandatory, description_mandatory)
  values ( 'EMPLOYMENT_STATUSES', true, 2, 3, null, true, true );
insert into cin.ref_data_tables ( table_name, code_mandatory, code_min_length, code_max_length, code_format, display_mandatory, description_mandatory)
  values ( 'GENDERS', true, 1, 1, '[0-9]', true, true );
insert into cin.ref_data_tables ( table_name, code_mandatory, code_min_length, code_max_length, code_format, display_mandatory, description_mandatory)
  values ( 'MARITAL_STATUSES', true, 1, 1, '[A-Z]', true, true );
insert into cin.ref_data_tables ( table_name, code_mandatory, code_min_length, code_max_length, code_format, display_mandatory, description_mandatory)
  values ( 'MATCH_STATUSES', true, 1, 1, '[A-Z]', true, true );

commit;

select rlm.component_registered ( 'ins_ref_data_tables.sql' );

\qecho Reference Data Table defaults inserted
