-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a' AS v
   UNION ALL
  
    SELECT
      2 AS k,
      'b' AS v
   UNION ALL
  
    SELECT
      3 AS k,
      'c' AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B.k AS k,
  B.v AS v
FROM
  t_0_B AS B, UNNEST(ARRAY[1, 2, 3]) as x_6
WHERE
  (B.k > 1) AND
  (B.v IS DISTINCT FROM 'c') AND
  (COALESCE(x_6, 0) = COALESCE(B.k, 0) AND (x_6 IS NULL) = (B.k IS NULL));