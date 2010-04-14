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
/*
01 - Regular Paid Employment
01A	Full-time	
01B	Part-time	
02 - Self Employed
02A	Full-time	
02B	Part-time	
03 - Looking after home/family
		
04 - Engaged in Voluntary Work (unpaid)
04A	Seeking paid employment	
04B	Not seeking paid employment	
05 - Unemployed
05A	Available / fit for work	
05B	Not available / not fit for work	
06 - Formal education (pupil or student)
06A	Full-time	
06B	Part-Time	
07 - Retired
07A	Career completion	
07B	Medically retired	
08 - Not applicable
		
09 - Permanently sick/disabled
		
10 - Temporarily sick/disabled (self-employed only)
		
11 - Government Training Scheme
		
12 - Other reasons not working
		
97 - Not disclosed
		
99 - Not Known
*/