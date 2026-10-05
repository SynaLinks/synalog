WITH t_0_V AS (SELECT * FROM VALUES
  (1, "a"),
  (1, "a"),
  (1, "b")
AS UNUSED_TABLE_NAME(x, y))
SELECT
  V.x AS x,
  V.y AS y
FROM
  t_0_V AS V
GROUP BY 1, 2 ORDER BY y NULLS LAST;