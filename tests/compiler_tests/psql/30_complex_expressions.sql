-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_8 AS col0,
  CASE WHEN (x_8 < 3) THEN ((x_8) * (2)) WHEN (x_8 < 6) THEN ((x_8) + (10)) ELSE ((((x_8) * (x_8))) - (20)) END AS col1
FROM
  UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_8 ORDER BY col0;