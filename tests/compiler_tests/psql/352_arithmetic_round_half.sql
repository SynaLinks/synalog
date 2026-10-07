-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  ROUND(CAST(CAST(2.5 AS double precision) AS numeric)) AS a,
  ROUND(CAST(CAST(-2.5 AS double precision) AS numeric)) AS b,
  ROUND(CAST(CAST(1.5 AS double precision) AS numeric)) AS c,
  ROUND(CAST(CAST(0.5 AS double precision) AS numeric)) AS d;