-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord12759636318561132807') then create type synalogrecord12759636318561132807 as ("x" numeric, "y" text); end if; END $$;
WITH t_2_K AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      2 AS k
   UNION ALL
  
    SELECT
      3 AS k
  
) AS UNUSED_TABLE_NAME  ),
t_3_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS v
   UNION ALL
  
    SELECT
      2 AS k,
      ROW(1, 'p')::synalogrecord12759636318561132807 AS v
   UNION ALL
  
    SELECT
      3 AS k,
      ROW(2, 'q')::synalogrecord12759636318561132807 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_K.k AS k,
  (t_1_V.v).y AS r
FROM
  t_2_K AS t_0_K, t_3_V AS t_1_V
WHERE
  (COALESCE(t_1_V.k, 0) = COALESCE(t_0_K.k, 0) AND (t_1_V.k IS NULL) = (t_0_K.k IS NULL)) ORDER BY k;