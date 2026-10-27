-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      5 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  V.x AS x,
  CAST((SELECT
  MAX((CASE WHEN x_9 = 0 THEN t_0_V.x ELSE NULL END)) AS synalog_value
FROM
  t_1_V AS t_0_V, UNNEST(ARRAY[0]) as x_9
WHERE
  (COALESCE(t_0_V.g, '') = COALESCE(V.g, '') AND (t_0_V.g IS NULL) = (V.g IS NULL))) AS numeric) AS m
FROM
  t_1_V AS V ORDER BY g, x;