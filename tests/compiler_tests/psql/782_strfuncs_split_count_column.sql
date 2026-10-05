-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_3 AS t,
  CARDINALITY((CASE WHEN x_3 = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY(x_3, ',') END)) AS n
FROM
  UNNEST(ARRAY['x', 'a,b,c']) as x_3 ORDER BY t;