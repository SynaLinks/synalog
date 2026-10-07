WITH t_0_V AS (SELECT * FROM VALUES
  ("b", 5),
  ("a", 1),
  ("a", 2)
AS UNUSED_TABLE_NAME(g, x))
SELECT
  V.g AS g,
  V.x AS x
FROM
  t_0_V AS V ORDER BY g NULLS LAST, x desc;