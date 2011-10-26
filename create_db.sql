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
-- These roles are used for access to different compoents within Cromby - do not alter
--

\qecho Create role ref_data_admin

create role ref_data_admin nologin inherit;
comment on role ref_data_admin is 'Role to maintain reference data.';
grant ref_data_admin to am_user;

\qecho Create role employee_admin

create role employee_admin nologin inherit;
comment on role employee_admin is 'Role to maintain employee and organisation data.';
grant employee_admin to am_user;

\qecho Create role security_admin

create role security_admin nologin inherit;
comment on role security_admin is 'Role to maintain Cromby user data.';
grant security_admin to am_user;

\qecho Create role system_admin

create role system_admin nologin inherit;
comment on role system_admin is 'Role to carry out system administration tasks.';
grant system_admin to am_user;

\qecho Create role cromby_archivist

create role cromby_archivist nologin inherit;
comment on role cromby_archivist is 'Role to carry out data cleanup and archiving.';

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
