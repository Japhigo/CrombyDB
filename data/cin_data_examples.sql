\qecho Inserting Customer Intelligence example data...

select rlm.register_component('CIN', 'cin_data_examples.sql');

\i ins_business_types.sql

\i ins_communication_languages.sql

\i ins_contact_point_usage_types.sql

\i ins_countries.sql

\i ins_employment_statuses.sql

\i ins_event_role_types.sql

\i ins_genders.sql

\i ins_marital_statuses.sql

select rlm.component_registered('cin_data_examples.sql');

\qecho Customer Intelligence example data inserted