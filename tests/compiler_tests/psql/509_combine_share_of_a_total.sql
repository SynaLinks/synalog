-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_4 AS x,
  (CAST(x_4 AS double precision) / NULLIF(CAST((SELECT
  SUM((CASE WHEN x_7 = 0 THEN x_9 ELSE NULL END)) AS synalog_value
FROM
  UNNEST(ARRAY[0]) as x_7, UNNEST(ARRAY[1, 3]) as x_9) AS numeric), 0)) AS s
FROM
  UNNEST(ARRAY[1, 3]) as x_4 ORDER BY x;