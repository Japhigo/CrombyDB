\qecho Creating BIR trigger for security_controls

select rlm.register_component('SEC', 'trg_bir_security_controls.sql');

create trigger bir_security_controls before insert on sec.security_controls
  for each row execute procedure sec.bir_sec_audit();

comment on trigger bir_security_controls on sec.security_controls is '@DOCBOOK Before Insert Row to check audit columns';

select rlm.component_registered('SEC', 'trg_bir_security_controls.sql');
