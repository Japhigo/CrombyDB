\qecho Creating domain component_type
create domain rlm.component_type as char(3)
  not null default 'PUB'
  constraint cname check ( value in ( 'ADM', 'BAT', 'CIN', 'PAM', 'PUB', 'RLM', 'SEC' ) );
