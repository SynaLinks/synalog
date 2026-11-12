-- Initializing PostgreSQL environment.
set client_min_messages to warning;
DO $$ BEGIN if not exists (select 1 from pg_namespace where nspname = 'synalog_home') then create schema synalog_home; end if; END $$;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
