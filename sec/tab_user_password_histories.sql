\qecho Creating table user_password_histories

select rlm.register_component('SEC', 'tab_user_password_histories.sql');

create table sec.user_password_histories
  (id                              serial                 primary key
  ,user_id                         int                    not null --references sec.users(id)
  ,password_digest                 text                   not null
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  );

comment on table sec.user_password_histories is '@DOCBOOK Record of previously used passwords.';
comment on column sec.user_password_histories.id is '@DOCBOOK Unique identifier for row.';
comment on column sec.user_password_histories.user_id is '@DOCBOOK Foreign key to <link linkend="sec-table-users">SEC.USERS.</link>';
comment on column sec.user_password_histories.password_digest is '@DOCBOOK Password encrypted using Bcrypt.';
comment on column sec.user_password_histories.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column sec.user_password_histories.created_at is '@DOCBOOK Date and time the record was created.';
comment on column sec.user_password_histories.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column sec.user_password_histories.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('SEC', 'tab_user_password_histories.sql');
