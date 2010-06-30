\qecho Creating view departments

select rlm.register_component ( 'PUBLIC', 'viw_departments.sql' );

create or replace view public.view_departments
as
  select pro.id
        ,pro.party_id
        ,pro.party_role_type_id
        ,pro.description as department_name
        ,pty.description as department_type
        ,pro.start_date
        ,pro.end_date
    from cin.party_roles pro join cin.party_role_types prt on prt.id = pro.party_role_type_id
   where prt.internal
     and pro.data_status_code != -1
     and current_date >= pro.start_date
     and current_date <= coalesce ( pro.end_date, current_date );

select rlm.component_registered ( 'viw_departments.sql' );
