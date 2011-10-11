\qecho Creating BIR trigger for default_roles

select rlm.register_component('SEC', 'trg_bir_default_roles.sql');

create trigger bir_default_roles before insert on sec.default_roles
  for each row execute procedure sec.bir_sec_audit();

comment on trigger bir_default_roles on sec.default_roles is '@DOCBOOK Before Insert Row to check audit columns';

select rlm.component_registered('SEC', 'trg_bir_default_roles.sql');
