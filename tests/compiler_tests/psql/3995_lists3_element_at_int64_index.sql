-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  (ARRAY[10, 20, 30])[CAST('1' AS BIGINT) + 1] AS e,
  (ARRAY['a', 'b'])[CAST(ROUND(CAST(CAST(1.0 AS double precision) AS numeric)) AS BIGINT) + 1] AS f,
  (ARRAY[1])[CAST(5 AS BIGINT) + 1] AS g;