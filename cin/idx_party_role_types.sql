\qecho Creating indexes on party_role_types

select rlm.register_component ('CIN', 'idx_party_role_types.sql');

create unique index party_role_types_display_idx on cin.party_role_types(lower(display));

comment on index cin.party_role_types_display_idx is '@DOCBOOK Index to enforce uniqueness of PARTY_ROLE_TYPES.DISPLAY.';

select rlm.component_registered('CIN', 'idx_party_role_types.sql');
