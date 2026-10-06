-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_3 AS m,
  CASE WHEN (x_3 = 2) THEN CASE WHEN ((((MOD(CAST(2023 AS numeric), NULLIF(CAST(4 AS numeric), 0))) = 0) AND ((MOD(CAST(2023 AS numeric), NULLIF(CAST(100 AS numeric), 0))) != 0)) OR ((MOD(CAST(2023 AS numeric), NULLIF(CAST(400 AS numeric), 0))) = 0)) THEN 29 ELSE 28 END ELSE (ARRAY[31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31])[((x_3) - (1)) + 1] END AS n
FROM
  UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 13 - 1) as x), '{}')) as x_3
WHERE
  (x_3 > 0) ORDER BY m;