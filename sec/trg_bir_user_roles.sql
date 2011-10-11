\qecho Creating BIR trigger for user_roles

select rlm.register_component('SEC', 'trg_bir_user_roles.sql');

create trigger bir_user_roles before insert on sec.user_roles
  for each row execute procedure sec.bir_sec_audit();

comment on trigger bir_user_roles on sec.user_roles is '@DOCBOOK Before Insert Row to check audit columns';

select rlm.component_registered('SEC', 'trg_bir_user_roles.sql');
