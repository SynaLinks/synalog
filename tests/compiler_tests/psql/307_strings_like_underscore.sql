-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_3 AS w
FROM
  UNNEST(ARRAY['abc', 'abbc', 'ac']) as x_3
WHERE
  (x_3 LIKE 'a_c' ESCAPE '\') ORDER BY w;
