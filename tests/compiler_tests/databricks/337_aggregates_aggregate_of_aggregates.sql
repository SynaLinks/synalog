WITH t_1_V AS (SELECT * FROM VALUES
  ("a", 1),
  ("a", 2),
  ("b", 7)
AS UNUSED_TABLE_NAME(g, x)),
t_0_S AS (SELECT
  V.g AS g,
  SUM(V.x) AS t
FROM
  t_1_V AS V
GROUP BY 1)
SELECT
  MAX(S.t) AS m
FROM
  t_0_S AS S;