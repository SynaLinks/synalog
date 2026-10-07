WITH t_1_V AS (SELECT * FROM VALUES
  ("a", 1),
  ("a", 2),
  ("b", 3)
AS UNUSED_TABLE_NAME(g, x))
SELECT
  V.g AS g,
  V.x AS x1,
  t_0_V.x AS x2
FROM
  t_1_V AS V, t_1_V AS t_0_V
WHERE
  (V.x < t_0_V.x) AND
  (t_0_V.g = V.g);