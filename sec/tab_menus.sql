\qecho Creating table menus

select rlm.register_component('SEC', 'tab_menus.sql');

create table sec.controllers
  (id                              serial                 primary key
  ,menu_set_id                     int                    not null --references sec.menu_sets(id)
  ,menu_name                       varchar(255)           not null check(length(menu_name) > 0)
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,unique(upper(menu_name))
  );

comment on table sec.menus is '@DOCBOOK Menus.';
comment on column sec.menus.id is '@DOCBOOK Unique identifier for row.';
comment on column sec.menus.menu_set_id is 'Foreign key to <link linkend="sec-table-menu_sets">MENU_SETS.</link>';
comment on column sec.menus.menu_name is '@DOCBOOK Descriptive menu name.';
comment on column sec.menus.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column sec.menus.created_at is '@DOCBOOK Date and time the record was created.';
comment on column sec.menus.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column sec.menus.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('SEC', 'tab_menus.sql');
