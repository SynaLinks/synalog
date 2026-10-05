DROP TABLE IF EXISTS logica_test.Better;
CREATE TABLE logica_test.Better AS WITH t_1_S AS (SELECT * FROM (
  
    SELECT
      'north' AS r,
      1 AS d,
      5 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      2 AS d,
      8 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      3 AS d,
      3 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      5 AS d,
      9 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      6 AS d,
      1 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      1 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      2 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      4 AS d,
      2 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      5 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      2 AS d,
      4 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      3 AS d,
      11 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      4 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      5 AS d,
      10 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      7 AS d,
      3 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_Better_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      S.d AS d,
      1 AS n
    FROM
      t_1_S AS S, t_1_S
    WHERE
      (t_1_S.v > S.v) AND
      (S.r = 'east') AND
      (t_1_S.r = 'east')
   UNION ALL
  
    SELECT
      t_2_S.d AS d,
      1 AS n
    FROM
      t_1_S AS t_2_S, t_1_S AS t_3_S
    WHERE
      (t_3_S.d < t_2_S.d) AND
      (t_2_S.r = 'east') AND
      (t_3_S.r = 'east') AND
      (t_3_S.v = t_2_S.v)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Better_MultBodyAggAux.d AS d,
  SUM(Better_MultBodyAggAux.n) AS n
FROM
  t_0_Better_MultBodyAggAux AS Better_MultBodyAggAux
GROUP BY 1;

-- Interacting with table logica_test.Better

WITH t_1_S AS (SELECT * FROM (
  
    SELECT
      'north' AS r,
      1 AS d,
      5 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      2 AS d,
      8 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      3 AS d,
      3 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      5 AS d,
      9 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      6 AS d,
      1 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      1 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      2 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      4 AS d,
      2 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      5 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      2 AS d,
      4 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      3 AS d,
      11 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      4 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      5 AS d,
      10 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      7 AS d,
      3 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      S.d AS d,
      S.v AS v
    FROM
      t_1_S AS S
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        logica_test.Better AS Better
      WHERE
        (Better.d = S.d)) IS NULL) AND
      (S.r = 'east')
   UNION ALL
  
    SELECT
      t_2_S.d AS d,
      t_2_S.v AS v
    FROM
      t_1_S AS t_2_S, logica_test.Better AS t_3_Better
    WHERE
      (t_3_Better.n < 1) AND
      (t_2_S.r = 'east') AND
      (t_3_Better.d = t_2_S.d)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.d AS d,
  Q_MultBodyAggAux.v AS v
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1, 2;
