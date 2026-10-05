-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  (CASE WHEN 'a*b' = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY('a*b', '*') END) AS a,
  (CASE WHEN 'x+y' = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY('x+y', '+') END) AS b,
  (CASE WHEN 'p|q' = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY('p|q', '|') END) AS c;
