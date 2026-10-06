-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  (MOD(CAST(x_2 AS numeric), NULLIF(CAST(2 AS numeric), 0))) AS k,
  SUM(1) AS n
FROM
  UNNEST(ARRAY[1, 2, 3, 4, 5]) as x_2
GROUP BY (MOD(CAST(x_2 AS numeric), NULLIF(CAST(2 AS numeric), 0))) ORDER BY k;