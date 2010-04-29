\qecho Creating BIR trigger for relationship_statuses

select rlm.register_component ( 'CIN', 'trg_bir_relationship_statuses.sql' );

create trigger bir_relationship_statuses before insert on cin.relationship_statuses
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_relationship_statuses.sql' );
