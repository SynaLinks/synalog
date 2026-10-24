-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  ARRAY_TO_STRING((CASE WHEN 'x.y.z' = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY('x.y.z', '.') END), '.') AS s;
