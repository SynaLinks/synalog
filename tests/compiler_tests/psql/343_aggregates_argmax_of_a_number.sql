-- Initializing PostgreSQL environment.
set client_min_messages to warning;
DO $$ BEGIN if not exists (select 1 from pg_namespace where nspname = 'synalog_home') then create schema synalog_home; end if; END $$;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      10 AS id,
      1 AS s
   UNION ALL
  
    SELECT
      30 AS id,
      9 AS s
   UNION ALL
  
    SELECT
      20 AS id,
      5 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (ARRAY_AGG(V.id order by V.s desc nulls last))[1] AS w
FROM
  t_1_V AS V;