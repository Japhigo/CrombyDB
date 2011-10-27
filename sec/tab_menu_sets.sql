\qecho Creating table menu_sets

select rlm.register_component('SEC', 'tab_menu_sets.sql');

create table sec.menu_sets
  (id                              serial                 primary key
  ,menu_set_name                   varchar(255)           not null check(length(menu_set_name) > 0)
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  );

comment on table sec.menu_sets is '@DOCBOOK Set of menus.';
comment on column sec.menu_sets.id is '@DOCBOOK Unique identifier for row.';
comment on column sec.menu_sets.menu_set_name is '@DOCBOOK Descriptive menu set name.';
comment on column sec.menu_sets.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column sec.menu_sets.created_at is '@DOCBOOK Date and time the record was created.';
comment on column sec.menu_sets.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column sec.menu_sets.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('SEC', 'tab_menu_sets.sql');
