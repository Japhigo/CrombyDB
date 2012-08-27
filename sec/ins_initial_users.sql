\qecho Inserting initial users...

select rlm.register_component('SEC', 'ins_initial_users.sql');

\qecho Insert System Administrator
begin;

insert into cin.parties
  (name
  ,data_status_code
  ,effective_from_date
  ,party_object_type_id
  )
  select 'System Administrator'
        ,1
        ,current_date
        ,pot.id
    from cin.party_object_types pot
   where pot.party_object_type_code = 'PER'
     and pot.internal;

insert into cin.party_persons
  (given_name
  ,family_name
  ,party_id
  ,data_status_code
  )
  select 'System'
        ,'Administrator'
        ,id
        ,1
    from cin.parties
   where name = 'System Administrator';

insert into sec.users
  (party_person_id
  ,user_name
  ,hashed_password
  ,password_expiry_date
  ,user_start_date
  )
  select id
        ,'sysadmin'
        ,'$2a$10$BmfIc.6RA/3tHflOpbEMEeB1inyfcEPu6cI3q0AaHp1VbOWZI1YEK'
        ,current_date - 1
        ,current_date
    from cin.party_persons
   where given_name = 'System'
     and family_name = 'Administrator';

insert into sec.user_roles
  (user_id
  ,system_role_id
  ,user_role_start_date
  )
  select usr.id as user_id
        ,rol.id as system_role_id
        ,current_date
    from sec.users usr
        ,sec.system_roles rol
   where usr.user_name = 'sysadmin'
     and rol.role_name = 'ref_data_admin';

insert into sec.user_roles
  (user_id
  ,system_role_id
  ,user_role_start_date
  )
  select usr.id as user_id
        ,rol.id as system_role_id
        ,current_date
    from sec.users usr
        ,sec.system_roles rol
   where usr.user_name = 'sysadmin'
     and rol.role_name = 'system_admin';

commit;

\qecho Insert User Administrator
begin;

insert into cin.parties
  (name
  ,data_status_code
  ,effective_from_date
  ,party_object_type_id
  )
  select 'User Administrator'
        ,1
        ,current_date
        ,pot.id
    from cin.party_object_types pot
   where pot.party_object_type_code = 'PER'
     and pot.internal;

insert into cin.party_persons
  (given_name
  ,family_name
  ,party_id
  ,data_status_code
  )
  select 'User'
        ,'Administrator'
        ,id
        ,1
    from cin.parties
   where name = 'User Administrator';

insert into sec.users
  (party_person_id
  ,user_name
  ,hashed_password
  ,password_expiry_date
  ,user_start_date
  )
  select id
        ,'usradmin'
        ,'$2a$10$mgb2JXit29SmmRa8WnxKquGGNqfFB4wkUDVc0m1iNoUdkcL.rAHZu'
        ,current_date - 1
        ,current_date
    from cin.party_persons
   where given_name = 'User'
     and family_name = 'Administrator';

insert into sec.user_roles
  (user_id
  ,system_role_id
  ,user_role_start_date
  )
  select usr.id as user_id
        ,rol.id as system_role_id
        ,current_date
    from sec.users usr
        ,sec.system_roles rol
   where usr.user_name = 'usradmin'
     and rol.role_name = 'security_admin';

insert into sec.user_roles
  (user_id
  ,system_role_id
  ,user_role_start_date
  )
  select usr.id as user_id
        ,rol.id as system_role_id
        ,current_date
    from sec.users usr
        ,sec.system_roles rol
   where usr.user_name = 'usradmin'
     and rol.role_name = 'employee_admin';
commit;

select rlm.component_registered('SEC', 'ins_initial_users.sql');

\qecho Initial users inserted
