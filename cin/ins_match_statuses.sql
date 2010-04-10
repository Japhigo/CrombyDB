\qecho Inserting Match Statuses ...

select rlm.register_component ( 'CIN', 'ins_match_statuses.sql' );

begin;
insert into cin.match_statuses ( match_status, description ) values ( 'Matched','Address PAF checked' );
insert into cin.match_statuses ( match_status, description ) values ( 'un-matched','Address not PAF checked' );
insert into cin.match_statuses ( match_status, description ) values ( 'Partial Match','Address partially PAF matched' );
commit;

select rlm.component_registered ( 'ins_match_statuses.sql' );

\qecho Match Statuses inserted
