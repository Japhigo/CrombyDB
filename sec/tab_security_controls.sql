\qecho Creating table security_controls

select rlm.register_component('SEC', 'tab_security_controls.sql');

create table sec.security_controls
  (days_until_password_expiry      int                    not null check(days_until_password_expiry >= 7 and days_until_password_expiry <= 90)
  ,min_password_length             int                    not null check(min_password_length >= 8 and min_password_length <= 30)
  ,max_password_length             int                    not null check(max_password_length >= 8 and max_password_length <= 30)
  ,password_history_count          int                    not null check(password_history_count >= 3 and password_history_count <= 99)
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,check(min_password_length <= max_password_length)
  );

comment on table sec.security_controls is '@DOCBOOK Control table to hold security settings.';
comment on column sec.security_controls.days_until_password_expiry is '@DOCBOOK Number of days from password creation until it expires (Min. 7, Max. 90).';
comment on column sec.security_controls.min_password_length is '@DOCBOOK Minimum number of characters allowed in a password (Min. 8, Max. 30).';
comment on column sec.security_controls.max_password_length is '@DOCBOOK Maximum number of characters allowed in a password (Min. 8, Max. 30).';
comment on column sec.security_controls.password_history_count is '@DOCBOOK Number of previous passwords stored in <link linkend="sec-table-user_password_histories">USER_PASSWORD_HISTORIES</link> (Min. 3, Max. 99).';
comment on column sec.security_controls.updated_by is '@DOCBOOK Username of user who created the record.';
comment on column sec.security_controls.updated_at is '@DOCBOOK Date and time the record was created.';
comment on column sec.security_controls.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column sec.security_controls.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('SEC', 'tab_security_controls.sql');
