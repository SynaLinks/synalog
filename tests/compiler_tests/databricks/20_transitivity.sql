WITH t_0_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 1)
AS UNUSED_TABLE_NAME(col0, col1))
SELECT
  Edge.col0 AS x,
  Edge.col1 AS y
FROM
  t_0_Edge AS Edge ORDER BY x NULLS LAST, y NULLS LAST;