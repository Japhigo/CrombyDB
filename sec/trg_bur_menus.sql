\qecho Creating BUR trigger for menus

select rlm.register_component('SEC', 'trg_bur_menus.sql');

create trigger bur_menus before update on sec.menus
  for each row execute procedure sec.bur_sec_audit();

comment on trigger bur_menus on sec.menus is '@DOCBOOK Before Update Row to check audit columns';

select rlm.component_registered('SEC', 'trg_bur_menus.sql');
