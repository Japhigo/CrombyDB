\qecho Creating view party_relationships

select rlm.register_component ( 'PUB', 'viw_party_relationships.sql' );

create or replace view public.vw_party_relationships
as
  select pre.id
        ,pre.from_party_role_id
        ,pre.to_party_role_id
        ,pre.description
        ,pre.relationship_priority_id
        ,description as relationship_priority_desc
        ,pre.relationship_status_id
        ,description as relationship_status_desc
        ,pre.start_date
        ,pre.end_date
    from cin.party_relationships pre left outer join 
         cin.relationship_priorities rep on rep.id = pre.relationship_priority_id left outer join
         cin.relationship_statuses res on res.id = pre.relationship_status_id
   where pre.data_status_code != -1;

select rlm.component_registered ( 'viw_party_relationships.sql' );
