-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  CASE WHEN (x_7 < 0) THEN -1 ELSE 1 END AS s,
  x_7 AS x
FROM
  UNNEST(ARRAY[5, -5]) as x_7 ORDER BY x;