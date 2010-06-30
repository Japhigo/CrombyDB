\qecho Creating view employees

select rlm.register_component ( 'PUBLIC', 'view_employees.sql' );

create or replace view public.view_employees
as
  select pty.id
        ,per.id as person_id
        ,pty.reference as employee_num
        ,pty.name
        ,per.given_name
        ,per.middle_names
        ,per.family_name
        ,per.title
        ,per.name_suffix
    from cin.parties pty join cin.persons per on per.party_id = pty.id
   where pty.internal
     and pty.data_status_code != -1
     and per.data_status_code != -1;

select rlm.component_registered ( 'view_employees.sql' );
