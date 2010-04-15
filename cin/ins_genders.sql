\qecho Inserting ISO 5218 Gender codes...

select rlm.register_component ( 'CIN', 'ins_genders.sql' );

begin;
insert into cin.genders ( code, display, description ) values ( '0', 'Not known', 'Not recorded' );
insert into cin.genders ( code, display, description ) values ( '1', 'Male', 'Male' );
insert into cin.genders ( code, display, description ) values ( '2', 'Female', 'Female' );
insert into cin.genders ( code, display, description ) values ( '9', 'Not specified', 'Indeterminate, unable to be classified' );
commit;

select rlm.component_registered ( 'ins_genders.sql' );

\qecho ISO 5218 Gender codes inserted
