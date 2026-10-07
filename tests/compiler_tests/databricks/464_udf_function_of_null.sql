WITH t_1_V AS (SELECT * FROM VALUES
  (1, null),
  (2, 2)
AS UNUSED_TABLE_NAME(k, x))
SELECT
  t_0_V.k AS k,
  COALESCE(((t_0_V.x) * (t_0_V.x)), -1) AS v
FROM
  t_1_V AS t_0_V ORDER BY k NULLS LAST;