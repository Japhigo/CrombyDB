\qecho Creating view on users

select rlm.register_component('PUB', 'viw_users.sql');

create or replace view public.vw_users
as
  select usr.id
        ,usr.user_uuid
        ,usr.party_person_id
        ,prt.name as party_name
        ,usr.user_name
        ,usr.hashed_password
        ,usr.salt
        ,usr.password_expiry_date - current_date as days_until_password_expiry
    from sec.users usr join
         cin.party_persons per on per.id = usr.party_person_id join
         cin.parties prt on prt.id = per.party_id
   where current_date >= usr.user_start_date
     and current_date <= coalesce(usr.user_end_date, current_date);

comment on view public.vw_users is '@DOCBOOK User information for logging on.';

select rlm.component_registered('PUB', 'viw_users.sql');
