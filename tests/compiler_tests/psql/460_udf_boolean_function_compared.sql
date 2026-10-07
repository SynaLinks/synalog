-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_6 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4]) as x_6
WHERE
  (true = ((MOD(CAST(x_6 AS numeric), NULLIF(CAST(2 AS numeric), 0))) = 0)) ORDER BY x;