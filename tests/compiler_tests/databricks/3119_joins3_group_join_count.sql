WITH t_0_E AS (SELECT * FROM VALUES
  (1, "a", 10),
  (2, "a", 20),
  (3, "b", null),
  (4, null, 5)
AS UNUSED_TABLE_NAME(id, g, v)),
t_1_F AS (SELECT * FROM VALUES
  ("a", 1),
  ("b", 2),
  (null, 3)
AS UNUSED_TABLE_NAME(g, w))
SELECT
  E.g AS g,
  SUM(1) AS n
FROM
  t_0_E AS E, t_1_F AS F
WHERE
  (F.g = E.g)
GROUP BY 1 ORDER BY g NULLS LAST;