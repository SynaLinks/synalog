-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_L AS (SELECT
  ARRAY_AGG(x_8) AS l
FROM
  UNNEST(ARRAY[3, 5]) as x_8)
SELECT
  x_3 AS x
FROM
  t_1_L AS t_0_L, UNNEST(t_0_L.l) as x_3, UNNEST(ARRAY[1, 3]) as x_5
WHERE
  (COALESCE(x_5, 0) = COALESCE(x_3, 0) AND (x_5 IS NULL) = (x_3 IS NULL));