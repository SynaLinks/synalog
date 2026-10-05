-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_15 AS x,
  ((x_15) + (5)) AS plus,
  ((x_15) - (3)) AS sub,
  ((x_15) * (2)) AS mul
FROM
  UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_15
WHERE
  (x_15 > 0) ORDER BY x;