DROP TABLE IF EXISTS logica_test.C;
CREATE TABLE logica_test.C AS WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  ARRAY_AGG(V.x) AS l
FROM
  t_0_V AS V
GROUP BY 1;

-- Interacting with table logica_test.C

WITH t_3_G AS (SELECT * FROM (
  
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
      logica_test.C AS C
   UNION ALL
  
    SELECT
      t_2_G.g AS g,
      ARRAY[] AS l
    FROM
      t_3_G AS t_2_G
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        logica_test.C AS t_4_C
      WHERE
        (t_4_C.g = t_2_G.g)) IS NULL)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.g AS g,
  CARDINALITY(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L ORDER BY g;