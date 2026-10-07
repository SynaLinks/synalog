WITH t_0_W AS (SELECT * FROM VALUES
  (1, "naïve"),
  (2, ""),
  (3, null)
AS UNUSED_TABLE_NAME(k, s))
SELECT
  W.k AS k,
  REVERSE(REVERSE(W.s)) AS v,
  REVERSE(W.s) AS r
FROM
  t_0_W AS W ORDER BY k NULLS LAST;