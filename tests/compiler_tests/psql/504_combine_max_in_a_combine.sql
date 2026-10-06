-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  CAST((SELECT
  MAX((CASE WHEN x_4 = 0 THEN x_6 ELSE NULL END)) AS logica_value
FROM
  UNNEST(ARRAY[0]) as x_4, UNNEST(ARRAY[4, 9, 2]) as x_6) AS numeric) AS m;