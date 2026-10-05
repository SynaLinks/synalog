WITH t_1_V AS (SELECT * FROM VALUES
  ("g", 7),
  ("g", 7)
AS UNUSED_TABLE_NAME(g, x))
SELECT
  t_0_V.g AS g,
  MIN(t_0_V.x) AS v
FROM
  t_1_V AS t_0_V
GROUP BY 1;