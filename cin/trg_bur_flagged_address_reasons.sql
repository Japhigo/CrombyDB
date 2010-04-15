\qecho Creating BUR trigger for flagged_address_reasons

select rlm.register_component ( 'CIN', 'trg_bur_flagged_address_reasons.sql' );

create trigger bur_flagged_address_reasons before update on cin.flagged_address_reasons
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_flagged_address_reasons.sql' );
