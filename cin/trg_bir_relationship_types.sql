\qecho Creating BIR trigger for relationship_types

select rlm.register_component ( 'CIN', 'trg_bir_relationship_types.sql' );

create trigger bir_relationship_types before insert on cin.relationship_types
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_relationship_types.sql' );
