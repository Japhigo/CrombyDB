\qecho Inserting data_statuses...

select rlm.register_component('CIN', 'ins_data_statuses.sql' );

insert into cin.data_statuses(code, description) values (-1, 'Marked for archival');
insert into cin.data_statuses(code, description) values (1, 'Created');
insert into cin.data_statuses(code, description) values (2, 'Updated');
insert into cin.data_statuses(code, description) values (3, 'End-dated');
insert into cin.data_statuses(code, description) values (4, 'End-date removed');
insert into cin.data_statuses(code, description) values (5, 'Logically deleted');
	
select rlm.component_registered('CIN', 'ins_data_statuses.sql' );

\qecho data_statuses inserted
