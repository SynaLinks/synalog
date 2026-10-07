WITH t_0_R AS (SELECT * FROM VALUES
  (1, 5, "b", true),
  (2, null, "a", false),
  (3, 2, null, true),
  (4, 5, "c", null),
  (5, -1, "B", false),
  (6, 2, "a", true),
  (7, null, null, false),
  (8, 9, "aa", true)
AS UNUSED_TABLE_NAME(k, x, s, b))
SELECT
  R.k AS k,
  (MOD(R.x, NULLIF(3, 0))) AS m
FROM
  t_0_R AS R ORDER BY m desc, k NULLS LAST;