WITH t_1_In1 AS (SELECT * FROM VALUES
  ("x", 1),
  ("x", 3),
  ("y", 5)
AS UNUSED_TABLE_NAME(g, v)),
t_0_T1 AS (SELECT
  In1.g AS g,
  SUM(In1.v) AS t
FROM
  t_1_In1 AS In1
GROUP BY 1)
SELECT
  T1.g AS g,
  T1.t AS t
FROM
  t_0_T1 AS T1 ORDER BY g NULLS LAST;