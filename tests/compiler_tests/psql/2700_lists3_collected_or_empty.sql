-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_C AS (SELECT
  V.g AS g,
  ARRAY_AGG(V.x) AS l
FROM
  t_3_V AS V
GROUP BY V.g),
t_5_G AS (SELECT * FROM (
  
    SELECT
      'a' AS g
   UNION ALL
  
    SELECT
      'b' AS g
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT * FROM (
  
    SELECT
      C.g AS g,
      C.l AS l
    FROM
      t_2_C AS C
   UNION ALL
  
    SELECT
      t_4_G.g AS g,
      CAST('{}' AS numeric[]) AS l
    FROM
      t_5_G AS t_4_G
    WHERE
      (CAST((SELECT
        MIN((CASE WHEN x_14 = 0 THEN 1 ELSE NULL END)) AS synalog_value
      FROM
        t_2_C AS t_6_C, UNNEST(ARRAY[0]) as x_14
      WHERE
        (COALESCE(t_6_C.g, '') = COALESCE(t_4_G.g, '') AND (t_6_C.g IS NULL) = (t_4_G.g IS NULL))) AS numeric) IS NULL)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.g AS g,
  CARDINALITY(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L ORDER BY g;