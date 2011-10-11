\qecho Creating BIR trigger for system_roles

select rlm.register_component('SEC', 'trg_bir_system_roles.sql');

create trigger bir_system_roles before insert on sec.system_roles
  for each row execute procedure sec.bir_sec_audit();

comment on trigger bir_system_roles on sec.system_roles is '@DOCBOOK Before Insert Row to check audit columns';

select rlm.component_registered('SEC', 'trg_bir_system_roles.sql');
