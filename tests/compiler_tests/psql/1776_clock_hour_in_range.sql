-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  SUM(1) AS n
FROM
  (SELECT current_timestamp AS timestamp) AS Now
WHERE
  (CAST(SUBSTR(CAST(Now.timestamp AS TEXT), 12, 2) AS BIGINT) >= 0) AND
  (CAST(SUBSTR(CAST(Now.timestamp AS TEXT), 12, 2) AS BIGINT) <= 23);
