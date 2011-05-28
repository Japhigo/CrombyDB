\qecho Creating view on security_controls

select rlm.register_component('PUB', 'viw_security_controls.sql');

create or replace view public.vw_security_controls
as
  select min_password_length
        ,max_password_length
    from sec.security_controls;

select rlm.component_registered('viw_security_controls.sql');
