-- Initializing PostgreSQL environment.
set client_min_messages to warning;
DO $$ BEGIN if not exists (select 1 from pg_namespace where nspname = 'synalog_home') then create schema synalog_home; end if; END $$;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      3 AS s
   UNION ALL
  
    SELECT
      'b' AS n,
      5 AS s
   UNION ALL
  
    SELECT
      'c' AS n,
      1 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (ARRAY_AGG(V.n order by V.s desc nulls last))[1] AS w
FROM
  t_1_V AS V;