\qecho Inserting Contact Point Usage Types...

select rlm.register_component ( 'CIN', 'ins_contact_point_usage_types.sql' );

begin;
insert into cin.contact_point_usage_types ( display, available ) values ( 'Private', true );
insert into cin.contact_point_usage_types ( display, available ) values ( 'Business', true );
commit;

select rlm.component_registered ( 'ins_contact_point_usage_types.sql' );

\qecho Contact Point Usage Types inserted
