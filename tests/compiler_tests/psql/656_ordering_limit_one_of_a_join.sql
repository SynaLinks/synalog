-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      2 AS k,
      'y' AS v
   UNION ALL
  
    SELECT
      1 AS k,
      'x' AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.k AS k,
  A.v AS v
FROM
  t_0_A AS A, UNNEST(ARRAY[1, 2]) as x_6
WHERE
  (COALESCE(A.k, 0) = COALESCE(x_6, 0) AND (A.k IS NULL) = (x_6 IS NULL)) ORDER BY k LIMIT 1;