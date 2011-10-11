\qecho Creating BUR trigger for controllers_by_system_role

select rlm.register_component('SEC', 'trg_bur_controllers_by_system_role.sql');

create trigger bur_controllers_by_system_role before update on sec.controllers_by_system_role
  for each row execute procedure sec.bur_sec_audit();

comment on trigger bur_controllers_by_system_role on sec.controllers_by_system_role is '@DOCBOOK Before Update Row to check audit columns';

select rlm.component_registered('SEC', 'trg_bur_controllers_by_system_role.sql');
