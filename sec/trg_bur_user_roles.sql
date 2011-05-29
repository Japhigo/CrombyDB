\qecho Creating BUR trigger for user_roles

select rlm.register_component('SEC', 'trg_bur_user_roles.sql');

create trigger bur_user_roles before update on sec.user_roles
  for each row execute procedure sec.bur_sec_audit();

select rlm.component_registered('trg_bur_user_roles.sql');
