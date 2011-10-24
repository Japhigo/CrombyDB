\qecho Creating AUR trigger function for creating party histories

select rlm.register_component('CIN', 'fnc_trg_aur_parties.sql');

create or replace function cin.aur_parties()
  returns trigger
as $aur_parties$
  begin
    
    insert into cin.party_histories
      (party_id
      ,reference
      ,name
      ,party_object_type_code
      ,party_type_id
      ,communication_language_id
      ,party_classification_id
      ,description
      ,internal
      ,created_by
      ,created_at
      ,updated_by
      ,updated_at
      ,data_status_code
      )
    values
      (old.id
      ,old.reference
      ,old.name
      ,old.party_object_type_code
      ,old.party_type_id
      ,old.communication_language_id
      ,old.party_classification_id
      ,old.description
      ,old.internal
      ,old.created_by
      ,old.created_at
      ,old.updated_by
      ,old.updated_at
      ,old.data_status_code
      );

    perform wkf.register_object_event
      ('PARTY'
      ,old.id
      ,'UPD');

    return new;

  end;
$bur_parties$ LANGUAGE plpgsql;

select rlm.component_registered('CIN', 'fnc_trg_aur_parties.sql');
