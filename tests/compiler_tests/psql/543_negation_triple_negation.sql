-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_NotA AS (SELECT
  x_17 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_17
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_20 = 0 THEN 1 ELSE NULL END)) AS logica_value
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
    MIN((CASE WHEN x_13 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_2_NotA AS NotA, UNNEST(ARRAY[0]) as x_13
  WHERE
    (NotA.x = x_10)) AS numeric) IS NULL))
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_3
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_0_NotNotA AS NotNotA, UNNEST(ARRAY[0]) as x_6
  WHERE
    (NotNotA.x = x_3)) AS numeric) IS NULL);