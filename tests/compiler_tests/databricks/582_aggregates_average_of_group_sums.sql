WITH t_1_V AS (SELECT * FROM VALUES
  ("a", 1),
  ("a", 3),
  ("b", 6)
AS UNUSED_TABLE_NAME(g, x)),
t_0_S AS (SELECT
  V.g AS g,
  SUM(V.x) AS t
FROM
  t_1_V AS V
GROUP BY 1)
SELECT
  AVG(S.t) AS a
FROM
  t_0_S AS S;