-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_4 AS x,
  (CAST(x_4 AS double precision) / (CAST((SELECT
  SUM((CASE WHEN x_7 = 0 THEN x_9 ELSE NULL END)) AS logica_value
FROM
  UNNEST(ARRAY[0]) as x_7, UNNEST(ARRAY[1, 3]) as x_9) AS numeric))) AS s
FROM
  UNNEST(ARRAY[1, 3]) as x_4 ORDER BY x;