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

SELECT
  t_1_D.d AS first,
  MIN(t_2_D.d) AS last
FROM
  logica_test.D AS t_1_D, logica_test.D AS t_2_D
WHERE
  (t_2_D.d >= t_1_D.d) AND
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.D AS t_3_D
  WHERE
    (t_3_D.d = ((t_1_D.d) - (1)))) IS NULL) AND
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.D AS t_4_D
  WHERE
    (t_4_D.d = ((t_2_D.d) + (1)))) IS NULL)
GROUP BY 1 ORDER BY first, last;
