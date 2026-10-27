-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_A AS (SELECT * FROM (
  
    SELECT
      CAST(null AS numeric) AS k,
      1 AS a
   UNION ALL
  
    SELECT
      5 AS k,
      2 AS a
   UNION ALL
  
    SELECT
      CAST(null AS numeric) AS k,
      3 AS a
  
) AS UNUSED_TABLE_NAME  ),
t_3_B AS (SELECT * FROM (
  
    SELECT
      CAST(null AS numeric) AS k,
      10 AS b
   UNION ALL
  
    SELECT
      5 AS k,
      20 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_A.a AS a,
  t_1_B.b AS b
FROM
  t_2_A AS t_0_A, t_3_B AS t_1_B
WHERE
  (COALESCE(t_1_B.k, 0) = COALESCE(t_0_A.k, 0) AND (t_1_B.k IS NULL) = (t_0_A.k IS NULL));