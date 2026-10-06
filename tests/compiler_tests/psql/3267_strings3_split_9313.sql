-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  CARDINALITY((CASE WHEN 'a, b, c' = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY('a, b, c', ', ') END)) AS n,
  ((CASE WHEN 'a, b, c' = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY('a, b, c', ', ') END))[0 + 1] AS first,
  ((CASE WHEN 'a, b, c' = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY('a, b, c', ', ') END))[((CARDINALITY((CASE WHEN 'a, b, c' = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY('a, b, c', ', ') END))) - (1)) + 1] AS last;