-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_5_A AS (SELECT * FROM (
  
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
t_6_B AS (SELECT * FROM (
  
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
t_4_L_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      'a' AS src,
      A.x AS l
    FROM
      t_5_A AS A
    WHERE
      (A.x <= 6)
   UNION ALL
  
    SELECT
      'b' AS src,
      B.x AS l
    FROM
      t_6_B AS B
    WHERE
      (B.x <= 6)
  
) AS UNUSED_TABLE_NAME  ),
t_3_L AS (SELECT
  L_MultBodyAggAux.src AS src,
  ARRAY_AGG(L_MultBodyAggAux.l) AS l
FROM
  t_4_L_MultBodyAggAux AS L_MultBodyAggAux
GROUP BY L_MultBodyAggAux.src),
t_7_M AS (SELECT * FROM (
  
    SELECT
      'a' AS src,
      CAST('{}' AS numeric[]) AS l
   UNION ALL
  
    SELECT
      'b' AS src,
      CAST('{}' AS numeric[]) AS l
  
) AS UNUSED_TABLE_NAME  ),
t_1_All AS (SELECT * FROM (
  
    SELECT
      t_2_L.src AS src,
      t_2_L.l AS l
    FROM
      t_3_L AS t_2_L
   UNION ALL
  
    SELECT
      M.src AS src,
      M.l AS l
    FROM
      t_7_M AS M
    WHERE
      (CAST((SELECT
        MIN((CASE WHEN x_20 = 0 THEN 1 ELSE NULL END)) AS logica_value
      FROM
        t_3_L AS t_8_L, UNNEST(ARRAY[0]) as x_20
      WHERE
        (t_8_L.src = M.src)) AS numeric) IS NULL)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_All.src AS src,
  CARDINALITY(t_0_All.l) AS n
FROM
  t_1_All AS t_0_All ORDER BY src;