WITH t_2_V AS (SELECT * FROM VALUES
  (1, 3, "ab"),
  (2, -4, "hello"),
  (3, 0, ""),
  (4, null, "x"),
  (5, 12, null),
  (6, 7, "seven")
AS UNUSED_TABLE_NAME(k, x, s))
SELECT
  t_0_V.k AS k,
  SQRT(((((t_0_V.x) * (t_0_V.x))) + (((12) * (12))))) AS v
FROM
  t_2_V AS t_0_V ORDER BY k NULLS LAST;