-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  CARDINALITY((CASE WHEN '' = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY('', ',') END)) AS n,
  ARRAY_TO_STRING((CASE WHEN '' = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY('', ',') END), ',') AS s;