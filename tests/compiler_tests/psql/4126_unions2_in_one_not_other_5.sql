-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_A AS (SELECT * FROM (
  
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
t_3_B AS (SELECT * FROM (
  
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
t_1_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      A.x AS x
    FROM
      t_2_A AS A
   UNION ALL
  
    SELECT
      B.x AS x
    FROM
      t_3_B AS B
  
) AS UNUSED_TABLE_NAME  ),
t_0_U AS (SELECT
  U_MultBodyAggAux.x AS x
FROM
  t_1_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY U_MultBodyAggAux.x)
SELECT
  U.x AS x
FROM
  t_0_U AS U
WHERE
  (U.x > 5) AND
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_2_A AS t_5_A, t_3_B AS t_6_B, UNNEST(ARRAY[0]) as x_10
  WHERE
    (COALESCE(t_6_B.x, 0) = COALESCE(t_5_A.x, 0) AND (t_6_B.x IS NULL) = (t_5_A.x IS NULL)) AND
    (COALESCE(U.x, 0) = COALESCE(t_5_A.x, 0) AND (U.x IS NULL) = (t_5_A.x IS NULL))) AS numeric) IS NULL) ORDER BY x;