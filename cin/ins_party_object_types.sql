\qecho Inserting Party Object Types...

select rlm.register_component('CIN', 'ins_party_object_types.sql');

begin;
insert into cin.party_object_types(party_object_type_code, internal) values ('PER', true);
insert into cin.party_object_types(party_object_type_code, internal) values ('GRP', true);
insert into cin.party_object_types(party_object_type_code, internal) values ('ORG', true);
insert into cin.party_object_types(party_object_type_code, internal) values ('PER', false);
insert into cin.party_object_types(party_object_type_code, internal) values ('GRP', false);
insert into cin.party_object_types(party_object_type_code, internal) values ('ORG', false);
commit;

select rlm.component_registered('CIN', 'ins_party_object_types.sql');

\qecho Party Object Types inserted
