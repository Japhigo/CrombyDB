\qecho Inserting Event Role Types...

select rlm.register_component ( 'CIN', 'ins_event_role_types.sql' );

begin;
insert into cin.event_role_types ( event_role_type, description ) values ( 'Caller','Party intiating the telephone conversation' );
insert into cin.event_role_types ( event_role_type, description ) values ( 'Listener','Party receiving the telephone conversation' );
insert into cin.event_role_types ( event_role_type, description ) values ( 'Correspondent','Party writing the correspondence' );
insert into cin.event_role_types ( event_role_type, description ) values ( 'Reader','Party dealing with the correspondence' );
insert into cin.event_role_types ( event_role_type, description ) values ( 'Data Enquirer','Party viewing the data' );
insert into cin.event_role_types ( event_role_type, description ) values ( 'Data Entry','Party adding or updating the data' );
commit;

select rlm.component_registered ( 'ins_event_role_types.sql' );

\qecho Event Role Types inserted
