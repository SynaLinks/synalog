-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_3
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_7 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_0_B AS B, UNNEST(ARRAY[0]) as x_7
  WHERE
    (COALESCE(B.x, 0) = COALESCE(x_3, 0) AND (B.x IS NULL) = (x_3 IS NULL)) AND
    (x_3 = 2)) AS numeric) IS NULL) ORDER BY x;