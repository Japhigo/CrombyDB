\qecho Creating BUR trigger for security_controls

select rlm.register_component('SEC', 'trg_bur_security_controls.sql');

create trigger bur_security_controls before update on sec.security_controls
  for each row execute procedure sec.bur_sec_audit();

select rlm.component_registered('trg_bur_security_controls.sql');
