-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  SUM(((CAST(ROUND(CAST(x_2 AS numeric)) AS BIGINT)) * (1000000000))) AS t
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_2;
