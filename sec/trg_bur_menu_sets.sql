\qecho Creating BUR trigger for menu_sets

select rlm.register_component('SEC', 'trg_bur_menu_sets.sql');

create trigger bur_menu_sets before update on sec.menu_sets
  for each row execute procedure sec.bur_sec_audit();

comment on trigger bur_menu_sets on sec.menu_sets is '@DOCBOOK Before Update Row to check audit columns';

select rlm.component_registered('SEC', 'trg_bur_menu_sets.sql');
