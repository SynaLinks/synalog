-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_8 AS x,
  CASE WHEN (x_8 > 7) THEN 'very_high' WHEN (x_8 > 4) THEN 'high' WHEN (x_8 > 1) THEN 'medium' ELSE 'low' END AS cat
FROM
  UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_8 ORDER BY x;