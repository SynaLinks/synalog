-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  CAST(ROUND(CAST((CAST(5 AS double precision) / (2)) AS numeric)) AS BIGINT) AS a,
  CAST(ROUND(CAST(- (CAST(5 AS double precision) / (2)) AS numeric)) AS BIGINT) AS b,
  CAST(ROUND(CAST(3.7 AS numeric)) AS BIGINT) AS c,
  CAST(ROUND(CAST((CAST(9 AS double precision) / (4)) AS numeric)) AS BIGINT) AS d;
