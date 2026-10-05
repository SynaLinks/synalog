-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_10 AS col0
FROM
  UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_10, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_12
WHERE
  (x_12 > 5) AND
  (x_12 = x_10) AND
  ((MOD(x_10, 2)) = 0) ORDER BY col0;