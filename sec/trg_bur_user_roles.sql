\qecho Creating BUR trigger for user_roles

select rlm.register_component('SEC', 'trg_bur_user_roles.sql');

create trigger bur_user_roles before update on sec.user_roles
  for each row execute procedure sec.bur_sec_audit();

comment on trigger bur_user_roles on sec.user_roles is '@DOCBOOK Before Update Row to check audit columns';

select rlm.component_registered('SEC', 'trg_bur_user_roles.sql');
