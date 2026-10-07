-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_7 AS x,
  ABS(x_7) AS y,
  100 AS z
FROM
  UNNEST(ARRAY[2, -3]) as x_11, UNNEST(ARRAY[2, -3]) as x_7
WHERE
  (x_7 = x_11) ORDER BY x;