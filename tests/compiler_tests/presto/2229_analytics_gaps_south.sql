DROP TABLE IF EXISTS logica_test.D;
CREATE TABLE logica_test.D AS WITH t_0_S AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.d AS d
FROM
  t_0_S AS S
WHERE
  (S.r = 'south')
GROUP BY 1;

-- Interacting with table logica_test.D

WITH t_0_B AS (SELECT
  MIN(t_1_D.d) AS lo,
  MAX(t_1_D.d) AS hi
FROM
  logica_test.D AS t_1_D)
SELECT
  x_3 AS d
FROM
  t_0_B AS B, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, ((B.hi) + (1))), x -> x < ((B.hi) + (1))), synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 > B.lo) AND
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.D AS t_2_D
  WHERE
    (t_2_D.d = x_3)) IS NULL);