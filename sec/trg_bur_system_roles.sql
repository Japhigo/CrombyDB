\qecho Creating BUR trigger for system_roles

select rlm.register_component('SEC', 'trg_bur_system_roles.sql');

create trigger bur_system_roles before insert on sec.system_roles
  for each row execute procedure sec.bur_sec_audit();

select rlm.component_registered('trg_bur_system_roles.sql');
