-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_M AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      2 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  M.k AS k,
  SUM(1) AS n
FROM
  t_1_M AS M, UNNEST(ARRAY[1, 2]) as x_4
WHERE
  (COALESCE(x_4, 0) = COALESCE(M.k, 0) AND (x_4 IS NULL) = (M.k IS NULL))
GROUP BY M.k ORDER BY k;