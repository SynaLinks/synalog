-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_A AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      6 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_4_B AS (SELECT * FROM (
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      6 AS x
   UNION ALL
  
    SELECT
      7 AS x
   UNION ALL
  
    SELECT
      8 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_All_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      A.x AS x
    FROM
      t_3_A AS A
   UNION ALL
  
    SELECT
      B.x AS x
    FROM
      t_4_B AS B
  
) AS UNUSED_TABLE_NAME  ),
t_1_All AS (SELECT
  All_MultBodyAggAux.x AS x
FROM
  t_2_All_MultBodyAggAux AS All_MultBodyAggAux
GROUP BY All_MultBodyAggAux.x),
t_5_Pick AS (SELECT * FROM (
  
    SELECT
      5 AS x
    FROM
      t_3_A AS t_6_A
    WHERE
      (t_6_A.x = 5)
   UNION ALL
  
    SELECT
      5 AS x
    FROM
      t_4_B AS t_7_B
    WHERE
      (t_7_B.x = 5)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_All.x AS x
FROM
  t_1_All AS t_0_All
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_5_Pick AS Pick, UNNEST(ARRAY[0]) as x_10
  WHERE
    (COALESCE(Pick.x, 0) = COALESCE(t_0_All.x, 0) AND (Pick.x IS NULL) = (t_0_All.x IS NULL))) AS numeric) IS NULL) ORDER BY x;