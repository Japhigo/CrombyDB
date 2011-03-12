\qecho Inserting ISO 5218 Gender codes...

select rlm.register_component('CIN', 'ins_genders.sql');

begin;
insert into cin.genders(code, display, description, effective_from_date) values ('0', 'Not known', 'Not recorded', current_date);
insert into cin.genders(code, display, description, effective_from_date) values ('1', 'Male', 'Male', current_date);
insert into cin.genders(code, display, description, effective_from_date) values ('2', 'Female', 'Female', current_date);
insert into cin.genders(code, display, description, effective_from_date) values ('9', 'Not specified', 'Indeterminate, unable to be classified', current_date);
commit;

select rlm.component_registered('ins_genders.sql');

\qecho ISO 5218 Gender codes inserted
