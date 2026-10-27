-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_NotA AS (SELECT
  x_17 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_17
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_20 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    UNNEST(ARRAY[0]) as x_20
  WHERE
    (x_17 = 1)) AS numeric) IS NULL)),
t_0_NotNotA AS (SELECT
  x_10 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_10
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_13 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_2_NotA AS NotA, UNNEST(ARRAY[0]) as x_13
  WHERE
    (COALESCE(NotA.x, 0) = COALESCE(x_10, 0) AND (NotA.x IS NULL) = (x_10 IS NULL))) AS numeric) IS NULL))
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_3
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_0_NotNotA AS NotNotA, UNNEST(ARRAY[0]) as x_6
  WHERE
    (COALESCE(NotNotA.x, 0) = COALESCE(x_3, 0) AND (NotNotA.x IS NULL) = (x_3 IS NULL))) AS numeric) IS NULL);