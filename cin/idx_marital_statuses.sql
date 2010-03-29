\qecho Creating indexes on marital_statuses

select rlm.register_component ( 'CIN', 'idx_marital_statuses.sql' );

create unique index marital_statuses_marital_status_idx on cin.marital_statuses ( upper ( marital_status ) );

select rlm.component_registered ( 'idx_marital_statuses.sql' );
