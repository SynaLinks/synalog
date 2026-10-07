-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  CASE WHEN (CAST(SUBSTR('1970-01-01', 6, 2) AS BIGINT) = 2) THEN CASE WHEN ((((MOD(CAST(CAST(SUBSTR('1970-01-01', 1, 4) AS BIGINT) AS numeric), NULLIF(CAST(4 AS numeric), 0))) = 0) AND ((MOD(CAST(CAST(SUBSTR('1970-01-01', 1, 4) AS BIGINT) AS numeric), NULLIF(CAST(100 AS numeric), 0))) != 0)) OR ((MOD(CAST(CAST(SUBSTR('1970-01-01', 1, 4) AS BIGINT) AS numeric), NULLIF(CAST(400 AS numeric), 0))) = 0)) THEN 29 ELSE 28 END ELSE (ARRAY[31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31])[((CAST(SUBSTR('1970-01-01', 6, 2) AS BIGINT)) - (1)) + 1] END AS n;