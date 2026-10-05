-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  SUM(1) AS n
FROM
  (SELECT current_timestamp AT TIME ZONE 'UTC' AS timestamp) AS Now, (SELECT to_char(current_timestamp AT TIME ZONE 'UTC', 'YYYY-MM-DD') AS date) AS Today
WHERE
  (SUBSTR(CAST(Now.timestamp AS TEXT), 1, 10) = Today.date);
