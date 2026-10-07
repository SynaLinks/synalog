-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_3 AS x,
  (MOD(CAST(x_3 AS numeric), NULLIF(CAST(3 AS numeric), 0))) AS r
FROM
  UNNEST(ARRAY[-7, 7]) as x_3 ORDER BY x;