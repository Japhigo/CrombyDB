\qecho Inserting Security Controls...

select rlm.register_component('SEC', 'ins_security_controls.sql');

begin;
insert into sec.security_controls
  (days_until_password_expiry
  ,min_password_length
  ,max_password_length
  ,password_history_count
  ,updated_by
  ,updated_at
  )
values
  (60
  ,8
  ,16
  ,6
  ,current_user
  ,current_timestamp
  );
commit;

select rlm.component_registered('ins_security_controls.sql');

\qecho Security Controls inserted
