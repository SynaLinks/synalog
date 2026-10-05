-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_L AS (SELECT
  ARRAY_AGG(DISTINCT x_3) AS l
FROM
  UNNEST(ARRAY['x', 'y', 'x']) as x_3)
SELECT
  COALESCE(ARRAY_LENGTH(t_0_L.l, 1), 0) AS n
FROM
  t_1_L AS t_0_L;