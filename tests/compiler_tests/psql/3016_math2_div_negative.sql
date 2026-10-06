-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  CAST((CASE WHEN ((-7) < 0) <> ((2) < 0) THEN CEIL(CAST(-7 AS double precision) / NULLIF(2, 0)) ELSE FLOOR(CAST(-7 AS double precision) / NULLIF(2, 0)) END) AS BIGINT) AS v;