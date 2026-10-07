-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_7 AS x,
  CASE WHEN (x_7 > 0) THEN 1 WHEN (x_7 < 0) THEN -1 ELSE 0 END AS s
FROM
  UNNEST(ARRAY[-2, 0, 5]) as x_7 ORDER BY x;