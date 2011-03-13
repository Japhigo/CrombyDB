\qecho Creating table party_group_histories

select rlm.register_component('CIN', 'tab_party_group_histories.sql');

create table cin.party_group_histories
  (id                              serial                 primary key
  ,party_group_id                  int                    not null references cin.party_groups(id)
  ,effective_date                  date
  ,dissolved_date                  date
  ,party_group_type_id             int
  ,member_count                    int
  ,created_by                      varchar(30)
  ,created_at                      timestamp
  ,updated_by                      varchar(30)
  ,updated_at                      timestamp
  ,data_status_code                smallint
  );

select rlm.component_registered('tab_party_group_histories.sql');
