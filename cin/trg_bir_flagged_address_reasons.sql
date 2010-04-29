\qecho Creating BIR trigger for flagged_address_reasons

select rlm.register_component ( 'CIN', 'trg_bir_flagged_address_reasons.sql' );

create trigger bir_flagged_address_reasons before insert on cin.flagged_address_reasons
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_flagged_address_reasons.sql' );
