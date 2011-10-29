\qecho Inserting initial users...

select rlm.register_component('SEC', 'ins_initial_users.sql');

\qecho Insert System Administrator
begin;

insert into cin.parties
  (name
  ,internal
  ,data_status_code
  )
values
  ('System Administrator'
  ,true
  ,1
  );

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
  ,salt
  ,password_expiry_date
  ,user_start_date
  )
  select id
        ,'sysadmin'
        ,'5d0e970dee12e31fbbd947c9e4c233818b7fd2cb32143856b9385dd879e6be0cae34498c6603ec4feb3ec07b305df035bfa945afa7ffff57a963ac55394e9d46'
        ,'5sGmeA6QdQcT9Xq9DCSzkGLtpstoPxkKjGfnz36gDaXg55dzp4DHlAsqf75rJUQo4BSFfUumW1F1zkKi2kD1k3acFmwns4l2k4UPalAu4ZvWpYt0wW7gxGPjMVn9PHREMkCiAfkP44XO9KZn2AAOXRk5QnSSjC00t1ID1JNvZfOJuzIX88nmkz9nEtlPXKQaZDuzIH9k7zDjRhluesE2PlSHTvgTDLFkf9zzD3enKmivAyWzbAJ4hQNEgzJbsDWnhseCMMxq9qoFKS1ze5fRC1dymGeBCHDta5MGNAA46Jb9XkUct4ve4PdqEyL4nUITA86w1XF54rQIlzXZuuGYckeWcu8utkgJjnciy3vSEoCLM9zxFZzUqkcrxHDigDNHwXJjpyy7Otg13VNyTvYlaDIaGDIWP1subhjtpCuwZptvCbJDLTe8YLx321j3cZVc4v5j01apiYX95FyGrnQNq0hWyLE9va8uIncwgCSuEgRGSOF9DKAkY2OzUgZovcrD'
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
  ,internal
  ,data_status_code
  )
values
  ('User Administrator'
  ,true
  ,1
  );

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
  ,salt
  ,password_expiry_date
  ,user_start_date
  )
  select id
        ,'usradmin'
        ,'38bc7c79ecebcce6f80c26e054af7e346280c958795538a5fb2dc62235691ce3a2c59dd212db2f45224d4bb985f6382ccea143df4ce2f19781a34f2097e160ec'
        ,'KGMfLDHP08gWQgHa70nDitFdMyCfHBOK1EemKe1xd8ujTr3G9VSXl3IvxXhzIuqx6X9LhRmiMQow5GWxU4lJIXeJWBXI3E6mdqcztMSwEnspKLfdGvywD7dhLYLqjAL2AlmzjJ7XhqZtD1ccA1WXo91lm2gFM0PpK4OwtnDlkaGqhaZn5vIZIiXFS4isBsGT1yP2oIB0Q0IhSCs4YR7ttpr1l1ezmWHjWoBfcDHVkCKXQyUmGoTxnwRl8wHe7TwnPugO369vLoyT1LfMaBj02DofqlLgx6xeDx3ebHQQ1AIgz1fyQweoINiasM99oHPVrMvYmbw5FR1XLSZbjOGMT2bA12aqBxMs9DBROvJigZWbdZfwKzok4j7arwpRfCe3WAGW0dniTDC7BIkNk7XHfYyHVqIo38qiHyGMefplVb6u3CEc0SHu2NV1qy0YWemD12RVKcSUkGeEhxbhUefe7Z19Xwq1cb2uJSCZrqjJLXdaIvdo57kH6RcOhwcVQzmL'
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
