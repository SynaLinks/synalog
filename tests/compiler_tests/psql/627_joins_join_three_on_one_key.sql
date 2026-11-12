-- Initializing PostgreSQL environment.
set client_min_messages to warning;
DO $$ BEGIN if not exists (select 1 from pg_namespace where nspname = 'synalog_home') then create schema synalog_home; end if; END $$;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_C AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'c' AS c
   UNION ALL
  
    SELECT
      2 AS k,
      'd' AS c
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_2_C.k AS k,
  'a' AS a,
  'b' AS b,
  t_2_C.c AS c
FROM
  t_3_C AS t_2_C
WHERE
  (1 = t_2_C.k);