-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  COALESCE(ARRAY_LENGTH(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 0 - 1) as x), '{}'), 1), 0) AS a,
  COALESCE(ARRAY_LENGTH(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, -2 - 1) as x), '{}'), 1), 0) AS b,
  COALESCE(ARRAY_LENGTH(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 3 - 1) as x), '{}'), 1), 0) AS c;