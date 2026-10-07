-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_1 AS part
FROM
  UNNEST((CASE WHEN 'a,b,c' = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY('a,b,c', ',') END)) as x_1
GROUP BY x_1 ORDER BY part;
