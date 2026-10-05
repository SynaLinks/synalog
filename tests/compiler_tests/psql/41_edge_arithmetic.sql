-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_11 AS x,
  (POW(x_11, 2)) AS squared,
  (POW(x_11, 3)) AS cubed
FROM
  UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
WHERE
  (x_11 > 0) AND
  (x_11 < 5) ORDER BY x;