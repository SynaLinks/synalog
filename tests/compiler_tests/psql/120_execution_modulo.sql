-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  (MOD(CAST(7 AS numeric), NULLIF(CAST(3 AS numeric), 0))) AS a,
  (MOD(CAST(9 AS numeric), NULLIF(CAST(3 AS numeric), 0))) AS b,
  (MOD(CAST(2 AS numeric), NULLIF(CAST(5 AS numeric), 0))) AS c;