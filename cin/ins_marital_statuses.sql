\qecho Inserting Marital Statuses...

select rlm.register_component ( 'CIN', 'ins_marital_statuses.sql' );

begin;
insert into cin.marital_statuses ( marital_status, description ) values ( 'Single','Single' );
insert into cin.marital_statuses ( marital_status, description ) values ( 'Married','Married' );
insert into cin.marital_statuses ( marital_status, description ) values ( 'Divorced','Divorced' );
insert into cin.marital_statuses ( marital_status, description ) values ( 'Widowed','Widowed' );
insert into cin.marital_statuses ( marital_status, description ) values ( 'Separated','Separated' );
insert into cin.marital_statuses ( marital_status, description ) values ( 'Civil Partnership','Civil Partnership' );
insert into cin.marital_statuses ( marital_status, description ) values ( 'Not Disclosed','Not Disclosed' );
commit;

select rlm.component_registered ( 'ins_marital_statuses.sql' );

\qecho Marital Statuses inserted
