\qecho Creating table non_user_logins

select rlm.register_component('SEC', 'tab_non_user_logins.sql');

create table sec.non_user_logins
  (id                              serial                 primary key
  ,user_name                       varchar(30)            not null
  ,session_user_name               name
  ,current_user_name               name
  ,client_address                  text
  ,created_at                      timestamp              not null
  );

comment on table sec.non_user_logins is '@DOCBOOK Records details of login attempts with non-existent usernames';
comment on column sec.non_user_logins.id is '@DOCBOOK Unique identifier for row.';
comment on column sec.non_user_logins.user_name is '@DOCBOOK Username supplied at login attempt.';
comment on column sec.non_user_logins.session_user_name is '@DOCBOOK Contents of <literal>SESSION_USER</literal>.';
comment on column sec.non_user_logins.current_user_name is '@DOCBOOK Contents of <literal>CURRENT_USER</literal>.';
comment on column sec.non_user_logins.client_address is '@DOCBOOK <literal>INET</literal> address of the client attemting to login.';
comment on column sec.non_user_logins.created_at is '@DOCBOOK Date and time created.';

select rlm.component_registered('tab_non_user_logins.sql');
