-- Initializing PostgreSQL environment.
set client_min_messages to warning;
DO $$ BEGIN if not exists (select 1 from pg_namespace where nspname = 'synalog_home') then create schema synalog_home; end if; END $$;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  (MOD(CAST(CAST(7.5 AS double precision) AS numeric), NULLIF(CAST(2 AS numeric), 0))) AS a,
  - (MOD(CAST(CAST(7.5 AS double precision) AS numeric), NULLIF(CAST(2 AS numeric), 0))) AS b,
  (MOD(CAST(CAST(5.5 AS double precision) AS numeric), NULLIF(CAST(CAST(2.5 AS double precision) AS numeric), 0))) AS c;