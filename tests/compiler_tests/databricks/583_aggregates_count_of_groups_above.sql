WITH t_1_V AS (SELECT * FROM VALUES
  ("a", 5),
  ("b", 1),
  ("c", 9)
AS UNUSED_TABLE_NAME(g, x)),
t_0_S AS (SELECT
  V.g AS g,
  SUM(V.x) AS t
FROM
  t_1_V AS V
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_S AS S
WHERE
  (S.t > 2);