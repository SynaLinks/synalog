-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_4 AS x,
  CASE WHEN (x_4 > 100) THEN 'large' WHEN (x_4 > 10) THEN 'medium' ELSE 'small' END AS size
FROM
  UNNEST(ARRAY[1, 50, 500]) as x_4 ORDER BY x;