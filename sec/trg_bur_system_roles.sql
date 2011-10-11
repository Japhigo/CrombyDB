\qecho Creating BUR trigger for system_roles

select rlm.register_component('SEC', 'trg_bur_system_roles.sql');

create trigger bur_system_roles before update on sec.system_roles
  for each row execute procedure sec.bur_sec_audit();

comment on trigger bur_system_roles on sec.system_roles is '@DOCBOOK Before Update Row to check audit columns';

select rlm.component_registered('SEC', 'trg_bur_system_roles.sql');
