-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  ROUND(CAST((CAST(7 AS double precision) / (3)) AS numeric), 3) AS a,
  ROUND(CAST(2.567 AS numeric), 2) AS b,
  ROUND(CAST((CAST(1 AS double precision) / (8)) AS numeric), 1) AS c;
