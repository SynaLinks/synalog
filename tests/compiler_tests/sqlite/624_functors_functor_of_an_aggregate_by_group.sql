WITH t_1_In1 AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      1 AS v
   UNION ALL
  
    SELECT
      'x' AS g,
      3 AS v
   UNION ALL
  
    SELECT
      'y' AS g,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_T1 AS (SELECT
  In1.g AS g,
  SUM(In1.v) AS t
FROM
  t_1_In1 AS In1
GROUP BY In1.g)
SELECT
  T1.g AS g,
  T1.t AS t
FROM
  t_0_T1 AS T1 ORDER BY g;