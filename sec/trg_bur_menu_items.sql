\qecho Creating BUR trigger for menu_items

select rlm.register_component('SEC', 'trg_bur_menu_items.sql');

create trigger bur_menu_items before update on sec.menu_items
  for each row execute procedure sec.bur_sec_audit();

comment on trigger bur_menu_items on sec.menu_items is '@DOCBOOK Before Update Row to check audit columns';

select rlm.component_registered('SEC', 'trg_bur_menu_items.sql');
