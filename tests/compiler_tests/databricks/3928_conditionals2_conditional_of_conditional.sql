WITH t_1_V AS (SELECT * FROM VALUES
  (1, 5, "a"),
  (2, -3, null),
  (3, 0, "c"),
  (4, null, "d"),
  (5, 12, null),
  (6, 7, "f")
AS UNUSED_TABLE_NAME(k, x, s))
SELECT
  t_0_V.k AS k,
  CASE WHEN (CASE WHEN (t_0_V.x > 0) THEN 1 ELSE 0 END = 1) THEN "p" ELSE "q" END AS v
FROM
  t_1_V AS t_0_V ORDER BY k NULLS LAST;