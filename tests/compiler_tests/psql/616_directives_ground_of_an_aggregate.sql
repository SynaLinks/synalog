-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DROP TABLE IF EXISTS logica_home.T CASCADE;
CREATE TABLE logica_home.T AS SELECT
  SUM(x_2) AS t
FROM
  UNNEST(ARRAY[1, 2]) as x_2;

-- Interacting with table logica_home.T

SELECT
  t_0_T.t AS a,
  t_1_T.t AS b
FROM
  logica_home.T AS t_0_T, logica_home.T AS t_1_T;