-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  SUBSTR(CAST(Now.timestamp AS TEXT), 11, 1) AS sep,
  SUBSTR(CAST(Now.timestamp AS TEXT), 8, 1) AS d,
  SUBSTR(CAST(Now.timestamp AS TEXT), 14, 1) AS c
FROM
  (SELECT current_timestamp AT TIME ZONE 'UTC' AS timestamp) AS Now;
