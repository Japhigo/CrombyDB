\qecho Creating BUR trigger for controllers

select rlm.register_component('SEC', 'trg_bur_controllers.sql');

create trigger bur_controllers before update on sec.controllers
  for each row execute procedure sec.bur_sec_audit();

comment on trigger bur_controllers on sec.controllers is '@DOCBOOK Before Update Row to check audit columns';

select rlm.component_registered('SEC', 'trg_bur_controllers.sql');
