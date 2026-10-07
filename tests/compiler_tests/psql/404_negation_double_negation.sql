-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_NotB AS (SELECT
  x_10 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_10
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_13 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    UNNEST(ARRAY[0]) as x_13
  WHERE
    (x_10 = 2)) AS numeric) IS NULL))
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_3
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_0_NotB AS NotB, UNNEST(ARRAY[0]) as x_6
  WHERE
    (NotB.x = x_3)) AS numeric) IS NULL);