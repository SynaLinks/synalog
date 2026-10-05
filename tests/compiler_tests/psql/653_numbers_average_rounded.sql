-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_A AS (SELECT
  AVG(x_3) AS a
FROM
  UNNEST(ARRAY[1, 2, 4]) as x_3)
SELECT
  ROUND(t_0_A.a, 2) AS r
FROM
  t_1_A AS t_0_A;