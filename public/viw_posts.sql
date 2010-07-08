\qecho Creating view posts

select rlm.register_component ( 'PUB', 'viw_posts.sql' );

create or replace view public.viw_posts
as
  select pro.id
        ,pro.party_id
        ,pro.party_role_type_id
        ,pro.description as post_name
        ,pty.description as post_type
        ,pro.start_date
        ,pro.end_date
    from cin.party_roles pro join cin.party_role_types prt on prt.id = pro.party_role_type_id join
         cin.parties par on par.id = pro.party_id
   where prt.internal
     and par.party_object_type_code = 'PER'
     and pro.data_status_code != -1
     and current_date >= pro.start_date
     and current_date <= coalesce ( pro.end_date, current_date );

select rlm.component_registered ( 'viw_departments.sql' );
