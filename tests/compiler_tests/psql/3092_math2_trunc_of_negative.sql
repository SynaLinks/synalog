-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  (CASE WHEN CAST(-3.7 AS double precision) < 0 THEN CEIL(CAST(-3.7 AS double precision)) ELSE FLOOR(CAST(-3.7 AS double precision)) END) AS v;