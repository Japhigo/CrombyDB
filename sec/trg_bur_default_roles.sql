\qecho Creating BUR trigger for default_roles

select rlm.register_component('SEC', 'trg_bur_default_roles.sql');

create trigger bur_default_roles before update on sec.default_roles
  for each row execute procedure sec.bur_sec_audit();

select rlm.component_registered('trg_bur_default_roles.sql');
