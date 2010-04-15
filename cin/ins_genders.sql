\qecho Inserting ISO 5218 Gender codes...

select rlm.register_component ( 'CIN', 'ins_genders.sql' );

begin;
insert into cin.genders ( code, display, description, available ) values ( '0', 'Not known', 'Not recorded', false );
insert into cin.genders ( code, display, description, available ) values ( '1', 'Male', 'Male', true );
insert into cin.genders ( code, display, description, available ) values ( '2', 'Female', 'Female', true );
insert into cin.genders ( code, display, description, available ) values ( '9', 'Not specified', 'Indeterminate, unable to be classified', false );
commit;

select rlm.component_registered ( 'ins_genders.sql' );

\qecho ISO 5218 Gender codes inserted
