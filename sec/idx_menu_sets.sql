\qecho Creating indexes on menu_sets

select rlm.register_component ('SEC', 'idx_menu_sets.sql');

create unique index menu_sets_menu_set_name_idx on sec.menu_sets(lower(menu_set_name));

comment on index sec.menu_sets_menu_set_name_idx is '@DOCBOOK Index to enforce uniqueness of MENU_SETS.MENU_SET_NAME.';

select rlm.component_registered('SEC', 'idx_menu_sets.sql');
