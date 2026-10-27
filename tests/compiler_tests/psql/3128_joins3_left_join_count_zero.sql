-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'a' AS g,
      10 AS v
   UNION ALL
  
    SELECT
      2 AS id,
      'a' AS g,
      20 AS v
   UNION ALL
  
    SELECT
      3 AS id,
      'b' AS g,
      CAST(null AS numeric) AS v
   UNION ALL
  
    SELECT
      4 AS id,
      CAST(null AS text) AS g,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_2_G AS (SELECT * FROM (
  
    SELECT
      'a' AS g
   UNION ALL
  
    SELECT
      'b' AS g
   UNION ALL
  
    SELECT
      'c' AS g
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_G.g AS g,
  COALESCE(CAST((SELECT
  SUM((CASE WHEN x_4 = 0 THEN 1 ELSE NULL END)) AS synalog_value
FROM
  t_1_E AS E, UNNEST(ARRAY[0]) as x_4
WHERE
  (COALESCE(E.g, '') = COALESCE(t_0_G.g, '') AND (E.g IS NULL) = (t_0_G.g IS NULL))) AS numeric), 0) AS n
FROM
  t_2_G AS t_0_G ORDER BY g;