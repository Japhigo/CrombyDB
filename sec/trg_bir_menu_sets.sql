\qecho Creating BIR trigger for menu_sets

select rlm.register_component('SEC', 'trg_bir_menu_sets.sql');

create trigger bir_menu_sets before insert on sec.menu_sets
  for each row execute procedure sec.bir_sec_audit();

comment on trigger bir_menu_sets on sec.menu_sets is '@DOCBOOK Before Insert Row to check audit columns.';

select rlm.component_registered('SEC', 'trg_bir_menu_sets.sql');
