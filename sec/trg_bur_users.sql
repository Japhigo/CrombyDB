\qecho Creating BUR trigger for users

select rlm.register_component('SEC', 'trg_bur_users.sql');

create trigger bur_users before update on sec.users
  for each row execute procedure sec.bur_sec_audit();

comment on trigger bur_users on sec.users is '@DOCBOOK Before Update Row to check audit columns';

select rlm.component_registered('SEC', 'trg_bur_users.sql');
