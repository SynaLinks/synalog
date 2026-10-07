DROP TABLE IF EXISTS logica_test.L;
CREATE TABLE logica_test.L AS WITH t_1_A AS (SELECT * FROM (
  
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
t_2_B AS (SELECT * FROM (
  
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
t_0_L_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      'a' AS src,
      A.x AS l
    FROM
      t_1_A AS A
    WHERE
      (A.x <= 6)
   UNION ALL
  
    SELECT
      'b' AS src,
      B.x AS l
    FROM
      t_2_B AS B
    WHERE
      (B.x <= 6)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  L_MultBodyAggAux.src AS src,
  ARRAY_AGG(L_MultBodyAggAux.l) AS l
FROM
  t_0_L_MultBodyAggAux AS L_MultBodyAggAux
GROUP BY 1;

-- Interacting with table logica_test.L

WITH t_3_M AS (SELECT * FROM (
  
    SELECT
      'a' AS src,
      ARRAY[] AS l
   UNION ALL
  
    SELECT
      'b' AS src,
      ARRAY[] AS l
  
) AS UNUSED_TABLE_NAME  ),
t_1_All AS (SELECT * FROM (
  
    SELECT
      t_2_L.src AS src,
      t_2_L.l AS l
    FROM
      logica_test.L AS t_2_L
   UNION ALL
  
    SELECT
      M.src AS src,
      M.l AS l
    FROM
      t_3_M AS M
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        logica_test.L AS t_4_L
      WHERE
        (t_4_L.src = M.src)) IS NULL)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_All.src AS src,
  CARDINALITY(t_0_All.l) AS n
FROM
  t_1_All AS t_0_All ORDER BY src;