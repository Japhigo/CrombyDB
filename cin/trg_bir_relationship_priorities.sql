\qecho Creating BIR trigger for relationship_priorities

select rlm.register_component ( 'CIN', 'trg_bir_relationship_priorities.sql' );

create trigger bir_relationship_priorities before insert on cin.relationship_priorities
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_relationship_priorities.sql' );
