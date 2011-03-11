\qecho Creating BIR trigger for system_roles

select rlm.register_component('SEC', 'trg_bir_system_roles.sql');

create trigger bir_system_roles before insert on sec.system_roles
  for each row execute procedure sec.bir_sec_audit();

select rlm.component_registered('trg_bir_system_roles.sql');
