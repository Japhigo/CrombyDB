\qecho Creating view on users

select rlm.register_component ( 'PUB', 'viw_users.sql' );

create or replace view public.view_users
as
  select id
        ,party_person_id
        ,user_name
        ,user_uuid
        ,'' as hashed_password
        ,salt
        ,password_expiry_date - current_date as days_until_password_expiry
    from sec.users
   where current_date >= user_start_date
     and current_date <= coalesce ( user_end_date, current_date );

select rlm.component_registered ( 'viw_users.sql' );
