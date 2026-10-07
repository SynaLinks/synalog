-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_T AS (SELECT
  SUM(x_4) AS t
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_4)
SELECT
  3 AS n,
  t_0_T.t AS t
FROM
  t_1_T AS t_0_T;