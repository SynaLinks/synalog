WITH t_0_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (1, 3)
AS UNUSED_TABLE_NAME(col0, col1))
SELECT
  Edge.col0 AS src,
  Edge.col1 AS dst
FROM
  t_0_Edge AS Edge ORDER BY src NULLS LAST, dst NULLS LAST;