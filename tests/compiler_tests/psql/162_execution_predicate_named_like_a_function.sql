-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_7 AS x,
  ABS(x_7) AS y,
  100 AS z
FROM
  UNNEST(ARRAY[2, -3]) as x_11, UNNEST(ARRAY[2, -3]) as x_7
WHERE
  (COALESCE(x_7, 0) = COALESCE(x_11, 0) AND (x_7 IS NULL) = (x_11 IS NULL)) ORDER BY x;