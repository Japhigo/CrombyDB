\qecho Creating table parties

select rlm.register_component('CIN', 'tab_parties.sql');

create table cin.parties
  (id                              serial                 primary key
  ,reference                       varchar(30)
  ,name                            varchar(255)
  ,party_object_type_id            int                    not null --references cin.party_object_types(id)
  ,party_type_id                   int                             --references cin.party_types(id)
  ,communication_language_id       int                             --references cin.communication_languages(id)
  ,party_classification_id         int                             --references cin.party_classifications(id)
  ,description                     varchar(255)
  ,effective_from_date             date                   not null
  ,effective_to_date               date
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,data_status_code                smallint               not null
  ,unique(reference)
  );

comment on table cin.parties is '@DOCBOOK Party information generic to all Party Types.';
comment on column cin.parties.id is '@DOCBOOK Unique identifier for row.';
comment on column cin.parties.reference is '@DOCBOOK Unique reference code used to identify a party.';
comment on column cin.parties.name is '@DOCBOOK Full name of the party.';
comment on column cin.parties.party_object_type_id is '@DOCBOOK Foreign key to <link linkend="cin-table-party_object_types">PARTY_OBJECT_TYPES.</link>.';
comment on column cin.parties.party_type_id is '@DOCBOOK Foreign key to <link linkend="cin-table-party_types">PARTY_TYPES.</link>.';
comment on column cin.parties.communication_language_id is '@DOCBOOK Foreign key to <link linkend="cin-table-communication_languages">COMMUNICATION_LANGUAGES.</link>.';
comment on column cin.parties.party_classification_id is '@DOCBOOK Foreign key to <link linkend="cin-table-party_classifications">PARTY_CLASSIFICATIONS.</link>.';
comment on column cin.parties.description is '@DOCBOOK Description of the party.';
comment on column cin.parties.effective_from_date is '@DOCBOOK Date the party is of interest from.';
comment on column cin.parties.effective_to_date is '@DOCBOOK Date from which the party is no longer of interest.';
comment on column cin.parties.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column cin.parties.created_at is '@DOCBOOK Date and time the record was created.';
comment on column cin.parties.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column cin.parties.updated_at is '@DOCBOOK Date and time the record was last updated.';
comment on column cin.parties.data_status_code is '@DOCBOOK Status code for the record.';

select rlm.component_registered('CIN', 'tab_parties.sql');
