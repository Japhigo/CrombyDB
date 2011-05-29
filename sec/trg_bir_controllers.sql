\qecho Creating BIR trigger for default_roles

select rlm.register_component('SEC', 'trg_bir_controllers.sql');

create trigger bir_controllers before insert on sec.controllers
  for each row execute procedure sec.bir_sec_audit();

comment on trigger bir_controllers is 'Before Insert Row to check audit columns';

select rlm.component_registered('trg_bir_controllers.sql');
