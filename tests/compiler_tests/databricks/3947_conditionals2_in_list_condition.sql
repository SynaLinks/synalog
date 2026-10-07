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
  CASE WHEN (ARRAY_CONTAINS(ARRAY(0, 5, 7), t_0_V.x)) THEN "listed" ELSE "other" END AS v
FROM
  t_1_V AS t_0_V ORDER BY k NULLS LAST;