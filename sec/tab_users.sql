\qecho Creating table users

select rlm.register_component('SEC', 'tab_users.sql');

create table sec.users
  (id                              serial                 primary key
  ,party_person_id                 int                    not null references cin.party_persons(id)
  ,user_name                       varchar(30)            not null
  ,user_uuid                       uuid                   not null
  ,hashed_password                 text                   not null
  ,salt                            text                   not null
  ,password_expiry_date            date                   not null
  ,user_start_date                 date                   not null
  ,user_end_date                   date
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,unique(user_name)
  );

select rlm.component_registered('tab_users.sql');
