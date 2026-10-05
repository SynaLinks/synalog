-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      'ada' AS name,
      'ada@analytical.org' AS email
   UNION ALL
  
    SELECT
      'ken' AS name,
      'ken@bell-labs.com' AS email
  
) AS UNUSED_TABLE_NAME  )
SELECT
  E.name AS name,
  ((CASE WHEN E.email = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY(E.email, '.') END))[((CARDINALITY((CASE WHEN E.email = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY(E.email, '.') END))) - (1)) + 1] AS tld
FROM
  t_0_E AS E ORDER BY name;
