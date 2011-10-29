\qecho Inserting Reference Data Table defaults...

select rlm.register_component('CIN', 'ins_ref_data_tables.sql');

begin;
insert into cin.ref_data_tables ( table_name, description, code_mandatory, code_min_length, code_max_length, code_format, description_mandatory)
  values ( 'contact_point_usage_types', 'Indicates the type of use for a contact point', false, 0, 0, null, false );
insert into cin.ref_data_tables ( table_name,  description, code_mandatory, code_min_length, code_max_length, code_format, description_mandatory)
  values ( 'employment_statuses', 'An individual''s employment status', true, 2, 3, null, true );
insert into cin.ref_data_tables ( table_name,  description, code_mandatory, code_min_length, code_max_length, code_format, description_mandatory)
  values ( 'genders', 'Gender (aka sex) of an individual', true, 1, 1, E'\d', true );
insert into cin.ref_data_tables ( table_name,  description, code_mandatory, code_min_length, code_max_length, code_format, description_mandatory)
  values ( 'marital_statuses', 'Marital status of an individual', true, 1, 1, null, true );
insert into cin.ref_data_tables ( table_name,  description, code_mandatory, code_min_length, code_max_length, code_format, description_mandatory)
  values ( 'match_statuses', 'Indicates whether an address has been matched against an external database of addresses e.g. PAF', true, 1, 1, null, true );

commit;

select rlm.component_registered('CIN', 'ins_ref_data_tables.sql');

\qecho Reference Data Table defaults inserted
