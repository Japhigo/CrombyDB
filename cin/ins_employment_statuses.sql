\qecho Inserting Employment Statuses...

select rlm.register_component ( 'CIN', 'ins_employment_statuses.sql' );

begin;
insert into cin.employment_statuses ( employment_status, description ) values ( 'Unemployed','Not in employment' );
insert into cin.employment_statuses ( employment_status, description ) values ( 'Student','In full time education' );
insert into cin.employment_statuses ( employment_status, description ) values ( 'Self Employed','Self employed' );
insert into cin.employment_statuses ( employment_status, description ) values ( 'Part Time','Employed for less than 30 hours per week' );
insert into cin.employment_statuses ( employment_status, description ) values ( 'Full Time','Employed for more than 30 hours per week' );
insert into cin.employment_statuses ( employment_status, description ) values ( 'Private Means','Private income' );
insert into cin.employment_statuses ( employment_status, description ) values ( 'Retired','Retired' );
commit;

select rlm.component_registered ( 'ins_employment_statuses.sql' );

\qecho Employment Statuses inserted
