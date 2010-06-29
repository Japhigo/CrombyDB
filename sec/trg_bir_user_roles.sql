\qecho Creating BIR trigger for user_roles

select rlm.register_component ( 'SEC', 'trg_bir_user_roles.sql' );

create trigger bir_user_roles before insert on sec.user_roles
  for each row execute procedure sec.bir_sec_audit();

select rlm.component_registered ( 'trg_bir_user_roles.sql' );
