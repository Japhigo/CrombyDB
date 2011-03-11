\qecho Creating domain release_type
create domain rlm.release_type as char(3)
  not null default 'UPG'
  constraint cname check(value in ('INS', 'DAT', 'UPG', 'FIX'));
