-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_C AS (SELECT
  ARRAY_AGG(x_3) AS l
FROM
  UNNEST(ARRAY[1]) as x_3
WHERE
  (x_3 > 5))
SELECT
  COALESCE(CARDINALITY(C.l), 0) AS n
FROM
  t_0_C AS C;