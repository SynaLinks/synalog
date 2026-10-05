-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  COALESCE(ARRAY_LENGTH((SELECT
  ARRAY_AGG((CASE WHEN x_3 = 0 THEN x_5 ELSE NULL END)) AS logica_value
FROM
  UNNEST(ARRAY[0]) as x_3, UNNEST(ARRAY[1, 2, 3]) as x_5), 1), 0) AS n;