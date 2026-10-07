-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_L AS (SELECT
  ARRAY_AGG(x_8) AS l
FROM
  UNNEST(ARRAY[1, 3]) as x_8)
SELECT
  x_3 AS x
FROM
  t_1_L AS t_0_L, UNNEST(t_0_L.l) as x_3, UNNEST(ARRAY[1, 2, 3]) as x_5
WHERE
  (x_5 = x_3) ORDER BY x;