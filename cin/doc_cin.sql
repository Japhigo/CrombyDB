\qecho Creating database comments...

select rlm.register_component('CIN', 'doc_cin.sql');

--comment on table business_types is '';


select rlm.component_registered('doc_cin.sql');

\qecho database comments created