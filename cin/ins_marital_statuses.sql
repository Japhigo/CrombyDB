\qecho Inserting Marital Statuses...

select rlm.register_component ( 'CIN', 'ins_marital_statuses.sql' );

begin;
insert into cin.marital_statuses ( code, display, description, available ) values ( 'S','Single','Single',true );
insert into cin.marital_statuses ( code, display, description, available ) values ( 'M','Married','Married/Civil Partner',true );
insert into cin.marital_statuses ( code, display, description, available ) values ( 'D','Divorced','Divorced/Dissolved Civil Partnership',true );
insert into cin.marital_statuses ( code, display, description, available ) values ( 'W','Widowed','Widowed/Surviving Civil Partner',true );
insert into cin.marital_statuses ( code, display, description, available ) values ( 'P','Separated','Separated',true );
insert into cin.marital_statuses ( code, display, description, available ) values ( 'N','Not Disclosed','Not Disclosed',true );
commit;

select rlm.component_registered ( 'ins_marital_statuses.sql' );

\qecho Marital Statuses inserted
