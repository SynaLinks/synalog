-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  LENGTH(SUBSTR(CAST(Now.timestamp AS TEXT), 12, 8)) AS n,
  SUBSTR(SUBSTR(CAST(Now.timestamp AS TEXT), 12, 8), 3, 1) AS a,
  SUBSTR(SUBSTR(CAST(Now.timestamp AS TEXT), 12, 8), 6, 1) AS b
FROM
  (SELECT current_timestamp AT TIME ZONE 'UTC' AS timestamp) AS Now;
