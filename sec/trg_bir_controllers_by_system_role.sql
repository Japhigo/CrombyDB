\qecho Creating BIR trigger for default_roles

select rlm.register_component('SEC', 'trg_bir_controllers_by_system_role.sql');

create trigger bir_controllers_by_system_role before insert on sec.controllers_by_system_role
  for each row execute procedure sec.bir_sec_audit();

comment on trigger bir_controllers_by_system_role on sec.controllers_by_system_role is '@DOCBOOK Before Insert Row to check audit columns';

select rlm.component_registered('trg_bir_controllers_by_system_role.sql');
