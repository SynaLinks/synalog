WITH t_0_W AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 3)
AS UNUSED_TABLE_NAME(k, x))
SELECT
  W.k AS k,
  CASE WHEN (W.k = 3) THEN ((W.x) * (2)) ELSE ((W.x) * (W.x)) END AS v
FROM
  t_0_W AS W ORDER BY k NULLS LAST;