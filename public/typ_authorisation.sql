\qecho Creating type authorisation

select rlm.register_component('PUB', 'typ_authorisation.sql');

create type public.authorisation as
  (user_name   varchar(30)
  ,auth_level  int
  );

comment on type public.authorisation is '@DOCBOOK Used to return User Name and security authorisation level.';

select rlm.component_registered('typ_authorisation.sql');
