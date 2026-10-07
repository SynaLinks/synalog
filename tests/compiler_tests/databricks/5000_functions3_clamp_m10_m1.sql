WITH t_1_V AS (SELECT * FROM VALUES
  (1, 3, "ab"),
  (2, -4, "hello"),
  (3, 0, ""),
  (4, null, "x"),
  (5, 12, null),
  (6, 7, "seven")
AS UNUSED_TABLE_NAME(k, x, s))
SELECT
  t_0_V.k AS k,
  (CASE WHEN -10 IS NULL OR (CASE WHEN t_0_V.x IS NULL OR -1 IS NULL THEN NULL ELSE LEAST(t_0_V.x, -1) END) IS NULL THEN NULL ELSE GREATEST(-10, (CASE WHEN t_0_V.x IS NULL OR -1 IS NULL THEN NULL ELSE LEAST(t_0_V.x, -1) END)) END) AS v
FROM
  t_1_V AS t_0_V ORDER BY k NULLS LAST;