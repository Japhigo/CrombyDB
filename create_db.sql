create role baron with login password 'baron' createrole;  -- 'login' is optional if you plan to use psql
select * from pg_user;    -- verify user created
select * from pg_shadow;  -- sysid listed here
create database cromby_development owner baron;
create database cromby_test owner baron; 
create database cromby_production owner baron;
revoke create on schema public from public;