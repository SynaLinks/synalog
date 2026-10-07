WITH t_1_X AS (SELECT * FROM VALUES
  (1, 7),
  (2, -7),
  (3, 2.5E0),
  (4, -2.5E0),
  (5, 0),
  (6, null),
  (7, 0.1E0),
  (8, -0.75E0)
AS UNUSED_TABLE_NAME(k, x))
SELECT
  t_0_X.k AS k,
  (MOD(t_0_X.x, NULLIF(-3, 0))) AS v
FROM
  t_1_X AS t_0_X ORDER BY k NULLS LAST;