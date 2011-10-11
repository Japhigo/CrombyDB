\qecho Inserting Security Controls...

select rlm.register_component('SEC', 'ins_security_controls.sql');

begin;
insert into sec.security_controls
  (days_until_password_expiry
  ,min_password_length
  ,max_password_length
  ,password_history_count
  )
values
  (60
  ,8
  ,16
  ,6
  );
commit;

select rlm.component_registered('SEC', 'ins_security_controls.sql');

\qecho Security Controls inserted
