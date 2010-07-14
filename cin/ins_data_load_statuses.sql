\qecho Inserting data_load_statuses...

select rlm.register_component ( 'CIN', 'ins_data_load_statuses.sql' );

insert into cin.data_load_statuses ( code, description ) values ( -1, 'Errors' );
insert into cin.data_load_statuses ( code, description ) values ( 0, 'Errors fixed' );
insert into cin.data_load_statuses ( code, description ) values ( 1, 'Loaded' );
insert into cin.data_load_statuses ( code, description ) values ( 2, 'Updated' );
	
select rlm.component_registered ( 'ins_data_load_statuses.sql' );

\qecho data_load_statuses inserted
