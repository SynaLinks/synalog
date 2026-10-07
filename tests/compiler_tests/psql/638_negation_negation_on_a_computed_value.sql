-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_3
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    UNNEST(ARRAY[1, 2, 3]) as x_10, UNNEST(ARRAY[0]) as x_6
  WHERE
    ((MOD(CAST(x_3 AS numeric), NULLIF(CAST(2 AS numeric), 0))) = 0) AND
    (x_3 = x_10)) AS numeric) IS NULL) ORDER BY x;