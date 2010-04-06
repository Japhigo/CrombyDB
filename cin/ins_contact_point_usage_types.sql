\qecho Inserting Contact Point Usage Types...

select rlm.register_component ( 'CIN', 'ins_contact_point_usage_types.sql' );

begin;
insert into cin.contact_point_usage_types ( contact_point_usage_type, description ) values ( 'PRIVATE','Private' );
insert into cin.contact_point_usage_types ( contact_point_usage_type, description ) values ( 'BUSINESS','Business' );
commit;

select rlm.component_registered ( 'ins_contact_point_usage_types.sql' );

\qecho Contact Point Usage Types inserted
