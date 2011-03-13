\qecho Creating table party_role_histories

select rlm.register_component('CIN', 'tab_party_role_histories.sql');

create table cin.party_role_histories
  (id                              serial                 primary key
  ,party_role_id                   int                    not null references cin.party_roles(id)
  ,party_id                        int
  ,party_role_type_id              int
  ,description                     varchar(255)
  ,start_date                      date
  ,end_date                        date
  ,created_by                      varchar(30)
  ,created_at                      timestamp
  ,updated_by                      varchar(30)
  ,updated_at                      timestamp
  ,data_status_code                smallint
  );

select rlm.component_registered('tab_party_role_histories.sql');
