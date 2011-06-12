\qecho Creating table security_controls

select rlm.register_component('SEC', 'tab_security_controls.sql');

create table sec.security_controls
  (days_until_password_expiry      int                    not null
  ,min_password_length             int                    not null
  ,max_password_length             int                    not null
  ,password_history_count          int                    not null
  ,lock_after_failed_attempts      int                    not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  );

comment on table sec.security_controls is '@DOCBOOK Control table to hold security settings.';
comment on column sec.security_controls.days_until_password_expiry is '@DOCBOOK Number of days from password creation until it expires.';
comment on column sec.security_controls.min_password_length is '@DOCBOOK Minimum number of characters allowed in a password.';
comment on column sec.security_controls.max_password_length is '@DOCBOOK Maximum number of characters allowed in a password.';
comment on column sec.security_controls.password_history_count is '@DOCBOOK Number of previous passwords stored in <link linkend="sec-table-user_password_histories">USER_PASSWORD_HISTORIES</link>.';
comment on column sec.security_controls.lock_after_failed_attempts is '@DOCBOOK Number of sequential failed logins allowed before a user''s account is locked.';
comment on column sec.security_controls.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column sec.security_controls.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('tab_security_controls.sql');
