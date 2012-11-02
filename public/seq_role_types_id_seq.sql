\qecho Creating sequence ROLE_TYPES_ID_SEQ

select rlm.register_component('PUB', 'seq_role_types_id_seq.sql');

create sequence role_types_id_seq
  increment 1
  minvalue 1
  maxvalue 9223372036854775807
  start 1
  cache 1;

select rlm.component_registered('PUB', 'seq_role_types_id_seq.sql');

