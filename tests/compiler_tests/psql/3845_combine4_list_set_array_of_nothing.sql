-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord15014184063026700746') then create type synalogrecord15014184063026700746 as ("arg" numeric, "value" numeric); end if; END $$;
SELECT
  CAST((SELECT
  ARRAY_AGG((CASE WHEN x_5 = 0 THEN 1 ELSE NULL END)) AS synalog_value
FROM
  UNNEST(ARRAY[0]) as x_5
WHERE
  (1 > 5)) AS numeric[]) AS l,
  CAST((SELECT
  ARRAY_AGG(DISTINCT (CASE WHEN x_8 = 0 THEN 1 ELSE NULL END)) AS synalog_value
FROM
  UNNEST(ARRAY[0]) as x_8
WHERE
  (1 > 5)) AS numeric[]) AS s,
  (SELECT
  ARRAY_AGG(((CASE WHEN x_13 = 0 THEN ROW(1, 1)::synalogrecord15014184063026700746 ELSE NULL END)).value order by ((CASE WHEN x_13 = 0 THEN ROW(1, 1)::synalogrecord15014184063026700746 ELSE NULL END)).arg) AS synalog_value
FROM
  UNNEST(ARRAY[0]) as x_13
WHERE
  (1 > 5)) AS a;