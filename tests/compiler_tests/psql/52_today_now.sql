-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  1 AS n
FROM
  (SELECT to_char(current_date, 'YYYY-MM-DD') AS date) AS Today, (SELECT current_timestamp AS timestamp) AS Now
WHERE
  (SUBSTR(CAST(Now.timestamp AS TEXT), 1, 10) = Today.date) ORDER BY n;