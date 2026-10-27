-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_5 AS x,
  x_7 AS y
FROM
  UNNEST(ARRAY[0, 1]) as x_5, UNNEST(ARRAY[0, 1]) as x_7
WHERE
  ((x_5 = 1) IS DISTINCT FROM (x_7 = 1)) ORDER BY x, y;