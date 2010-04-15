\qecho Inserting Match Statuses ...

select rlm.register_component ( 'CIN', 'ins_match_statuses.sql' );

begin;
insert into cin.match_statuses ( code, display, description, available ) values ( 'M', 'Matched','Address PAF checked', true );
insert into cin.match_statuses ( code, display, description, available ) values ( 'U', 'un-matched','Address not PAF checked', true );
insert into cin.match_statuses ( code, display, description, available ) values ( 'P', 'Partial Match','Address partially PAF matched', true );
commit;

select rlm.component_registered ( 'ins_match_statuses.sql' );

\qecho Match Statuses inserted
