-- Initializing PostgreSQL environment.
set client_min_messages to warning;
DO $$ BEGIN if not exists (select 1 from pg_namespace where nspname = 'synalog_home') then create schema synalog_home; end if; END $$;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_7 AS x,
  ABS(x_7) AS y,
  100 AS z
FROM
  UNNEST(ARRAY[2, -3]) as x_11, UNNEST(ARRAY[2, -3]) as x_7
WHERE
  (x_7 = x_11) ORDER BY x;