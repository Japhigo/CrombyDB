\qecho Creating BIR trigger for menu_items

select rlm.register_component('SEC', 'trg_bir_menu_items.sql');

create trigger bir_menu_items before insert on sec.menu_items
  for each row execute procedure sec.bir_sec_audit();

comment on trigger bir_menu_items on sec.menu_items is '@DOCBOOK Before Insert Row to check audit columns';

select rlm.component_registered('SEC', 'trg_bir_menu_items.sql');
