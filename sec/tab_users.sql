\qecho Creating table users

select rlm.register_component('SEC', 'tab_users.sql');

create table sec.users
  (id                              serial                 primary key
  ,party_person_id                 int                    not null --references cin.party_persons(id)
  ,user_name                       varchar(30)            not null check(length(user_name) > 0)
  ,password_digest                 text                   not null
  ,password_expiry_date            date                   not null
  ,user_start_date                 date                   not null
  ,user_end_date                   date
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  );

comment on table sec.users is '@DOCBOOK Cromby users.';
comment on column sec.users.id is '@DOCBOOK Unique identifier for row.';
comment on column sec.users.party_person_id is '@DOCBOOK Foreign key to <link linkend="cin-table-party_persons">PARTY_PERSONS.</link>';
comment on column sec.users.user_name is '@DOCBOOK Unique username used to log on to Cromby.';
comment on column sec.users.password_digest is '@DOCBOOK Password encrypted using Bcrypt.';
comment on column sec.users.password_expiry_date is '@DOCBOOK Date after which a user''s password will cease to work.';
comment on column sec.users.user_start_date is '@DOCBOOK Date from which the username can be used.';
comment on column sec.users.user_end_date is '@DOCBOOK Date after which a username cannot be used.';
comment on column sec.users.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column sec.users.created_at is '@DOCBOOK Date and time the record was created.';
comment on column sec.users.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column sec.users.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('SEC', 'tab_users.sql');
