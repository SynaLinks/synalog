-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  2 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_3
WHERE
  (x_3 = 2) AND
  (2 = CAST(2.0 AS double precision));