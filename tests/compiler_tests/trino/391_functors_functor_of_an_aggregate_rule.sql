WITH t_1_S1 AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS v
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS v
   UNION ALL
  
    SELECT
      'b' AS g,
      4 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_R0 AS (SELECT
  S1.g AS g,
  SUM(S1.v) AS t
FROM
  t_1_S1 AS S1
GROUP BY 1)
SELECT
  R0.g AS g,
  R0.t AS t
FROM
  t_0_R0 AS R0 ORDER BY g;