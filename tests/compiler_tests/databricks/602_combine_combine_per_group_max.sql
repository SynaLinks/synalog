WITH t_1_V AS (SELECT * FROM VALUES
  ("a", 1),
  ("a", 2),
  ("b", 5)
AS UNUSED_TABLE_NAME(g, x))
SELECT
  V.g AS g,
  V.x AS x,
  (SELECT
  MAX(t_0_V.x) AS logica_value
FROM
  t_1_V AS t_0_V
WHERE
  (t_0_V.g = V.g)) AS m
FROM
  t_1_V AS V ORDER BY g NULLS LAST, x NULLS LAST;