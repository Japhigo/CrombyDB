--
-- You should change the name and password of the database owner, and set the password to be encrypted
--
create role baron with login password 'baron' createrole;
--
-- These are the users used to connect to the database.  You should change these as appropriate, but remember to make
-- the necessary changes in the configuration of CrombyUM and CrombyAM
--
create role am_user with login password 'am_user' noinherit;
create role um_user with login password 'um_user' noinherit;
create role batch_user with login password 'batch_user' noinherit;

\i db_roles.sql

--
select * from pg_user;    -- verify user created
select * from pg_shadow;  -- sysid listed here
--
-- Create three databases as per rails
--
create database cromby_development owner baron;
create database cromby_test owner baron; 
create database cromby_production owner baron;
