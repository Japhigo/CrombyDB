\qecho Inserting data_statuses...

select rlm.register_component ( 'CIN', 'ins_data_statuses.sql' );

insert into cin.data_statuses ( code, description ) values ( -1, 'Redundant' );
insert into cin.data_statuses ( code, description ) values ( 0, 'Restored' );
insert into cin.data_statuses ( code, description ) values ( 1, 'Created' );
insert into cin.data_statuses ( code, description ) values ( 2, 'Updated' );

select rlm.component_registered ( 'ind_data_statuses.sql' );

\qecho data_statuses inserted
