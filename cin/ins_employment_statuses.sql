\qecho Inserting Employment Statuses...

select rlm.register_component ( 'CIN', 'ins_employment_statuses.sql' );

begin;
insert into cin.employment_statuses ( code, display, description, available ) values ( '01A', 'Employed full-time', 'Regular Paid Employment - Full-time', true );
insert into cin.employment_statuses ( code, display, description, available ) values ( '01B', 'Employed part-time', 'Regular Paid Employment - part-time', true );
insert into cin.employment_statuses ( code, display, description, available ) values ( '02A', 'Self Employed full-time', 'Self Employed full-time', true );
insert into cin.employment_statuses ( code, display, description, available ) values ( '02A', 'Self Employed part-time', 'Self Employed part-time', true );
insert into cin.employment_statuses ( code, display, description, available ) values ( '03', 'Looking after home/family', 'Looking after home/family', true );
insert into cin.employment_statuses ( code, display, description, available ) values ( '04', 'Voluntary Work', 'Engaged in Voluntary Work (unpaid)', true );
insert into cin.employment_statuses ( code, display, description, available ) values ( '05', 'Unemployed', 'Unemployed', true );
insert into cin.employment_statuses ( code, display, description, available ) values ( '06A', 'Education full-time', 'Formal education (pupil or student) - Full-time', true );
insert into cin.employment_statuses ( code, display, description, available ) values ( '06A', 'Education part-time', 'Formal education (pupil or student) - part-time', true );
insert into cin.employment_statuses ( code, display, description, available ) values ( '07', 'Retired', 'Retired', true );
insert into cin.employment_statuses ( code, display, description, available ) values ( '08', 'Not applicable', 'Not applicable', true );
insert into cin.employment_statuses ( code, display, description, available ) values ( '09', 'Permanently sick/disabled', 'Permanently sick/disabled', false );
insert into cin.employment_statuses ( code, display, description, available ) values ( '10', 'Temp. sick/disabled (SE only)', 'Temporarily sick/disabled (self-employed only)', false );
insert into cin.employment_statuses ( code, display, description, available ) values ( '11', 'Government Training Scheme', 'Government Training Scheme', false );
insert into cin.employment_statuses ( code, display, description, available ) values ( '12', 'Other reasons not working', 'Other reasons not working', false );
insert into cin.employment_statuses ( code, display, description, available ) values ( '97', 'Not disclosed', 'Not disclosed', false );
insert into cin.employment_statuses ( code, display, description, available ) values ( '99', 'Not known', 'Not known', false );
commit;

select rlm.component_registered ( 'ins_employment_statuses.sql' );

\qecho Employment Statuses inserted
/*
10 - Temporarily sick/disabled (self-employed only)
		
11 - Government Training Scheme
		
12 - Other reasons not working
		
97 - Not disclosed
		
99 - Not Known
*/