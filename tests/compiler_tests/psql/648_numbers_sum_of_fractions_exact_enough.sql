-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  SUM(x_2) AS t
FROM
  UNNEST(ARRAY[CAST(0.25 AS double precision), CAST(0.25 AS double precision), CAST(0.5 AS double precision)]) as x_2;