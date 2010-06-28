\qecho Creating BIR trigger for users

select rlm.register_component ( 'SEC', 'trg_bir_users.sql' );

create trigger bir_users before insert on sec.users
  for each row execute procedure sec.bir_users();

select rlm.component_registered ( 'trg_bir_users.sql' );
