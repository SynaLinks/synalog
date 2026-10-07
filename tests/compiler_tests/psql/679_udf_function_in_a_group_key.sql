-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  CASE WHEN (x_6 > 5) THEN 'big' ELSE 'small' END AS s,
  SUM(1) AS n
FROM
  UNNEST(ARRAY[1, 7, 9]) as x_6
GROUP BY CASE WHEN (x_6 > 5) THEN 'big' ELSE 'small' END ORDER BY s;