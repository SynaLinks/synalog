-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      1 AS v
   UNION ALL
  
    SELECT
      CAST(null AS numeric) AS k,
      2 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_B AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      CAST(null AS numeric) AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.v AS v
FROM
  t_0_A AS A, t_1_B AS B
WHERE
  (COALESCE(B.k, 0) = COALESCE(A.k, 0) AND (B.k IS NULL) = (A.k IS NULL));