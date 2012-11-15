\o cromby_create_db.log

--
-- You should change the name and password of the database owner, and set the password to be encrypted
--

\qecho Create Database owner

create role baron with login password 'baron' createrole;

--
-- These are the users used to connect to the database.  You should change these as appropriate, but remember to make
-- the necessary changes in the configuration of CrombyUM and CrombyAM
--

\qecho Create login roles

create role am_user with login password 'am_user' noinherit;
create role um_user with login password 'um_user' noinherit;
create role batch_user with login password 'batch_user' noinherit;

--
-- Verify users
--

select * from pg_user;    -- verify user created
select * from pg_shadow;  -- sysid listed here

--
-- Create three databases as per rails
--

\qecho Create the databases

create database cromby_development owner baron;
create database cromby_test owner baron; 
create database cromby_production owner baron;

\qecho Grant select on pg_catalog.pg_proc

grant select on pg_catalog.pg_proc to am_user;
grant select on pg_catalog.pg_proc to um_user;
grant select on pg_catalog.pg_proc to batch_user;

