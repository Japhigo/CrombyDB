\qecho Creating indexes on menus

select rlm.register_component ('SEC', 'idx_menus.sql');

create unique index menus_menu_name_idx on sec.menus(lower(menu_name));

comment on index sec.menus_menu_name_idx is '@DOCBOOK Index to enforce uniqueness of MENUS.MENU_NAME.';

select rlm.component_registered('SEC', 'idx_menus.sql');
