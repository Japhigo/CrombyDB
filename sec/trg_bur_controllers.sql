\qecho Creating BUR trigger for default_roles

select rlm.register_component('SEC', 'trg_bur_controllers.sql');

create trigger bur_controllers before insert on sec.controllers
  for each row execute procedure sec.bur_sec_audit();

comment on trigger bur_controllers is 'Before Update Row to check audit columns';

select rlm.component_registered('trg_bur_controllers.sql');
