-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord4731752025327218895') then create type synalogrecord4731752025327218895 as ("v" numeric); end if; END $$;
WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ROW(null)::synalogrecord4731752025327218895 AS r
   UNION ALL
  
    SELECT
      2 AS k,
      ROW(3)::synalogrecord4731752025327218895 AS r
  
) AS UNUSED_TABLE_NAME  ),
t_1_B AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      2 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.k AS k
FROM
  t_0_A AS A, t_1_B AS B
WHERE
  ((A.r).v IS null) AND
  (COALESCE(B.k, 0) = COALESCE(A.k, 0) AND (B.k IS NULL) = (A.k IS NULL));