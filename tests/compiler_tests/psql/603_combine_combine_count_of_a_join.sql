-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  CAST((SELECT
  SUM((CASE WHEN x_5 = 0 THEN 1 ELSE NULL END)) AS synalog_value
FROM
  UNNEST(ARRAY[0]) as x_5, UNNEST(ARRAY[1, 2, 3]) as x_7, UNNEST(ARRAY[2, 3, 4]) as x_9
WHERE
  (COALESCE(x_9, 0) = COALESCE(x_7, 0) AND (x_9 IS NULL) = (x_7 IS NULL))) AS numeric) AS n;