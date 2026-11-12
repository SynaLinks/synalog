-- Initializing PostgreSQL environment.
set client_min_messages to warning;
DO $$ BEGIN if not exists (select 1 from pg_namespace where nspname = 'synalog_home') then create schema synalog_home; end if; END $$;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_P AS (SELECT * FROM (
  
    SELECT
      'a' AS name,
      100 AS score
   UNION ALL
  
    SELECT
      'b' AS name,
      20 AS score
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.name AS name,
  P.score AS score
FROM
  t_1_P AS P ORDER BY score;
