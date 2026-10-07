WITH t_1_N AS (SELECT * FROM VALUES
  (1, "x"),
  (2, "y"),
  (3, "z")
AS UNUSED_TABLE_NAME(n, s))
SELECT
  t_0_N.n AS n,
  CASE WHEN (t_0_N.n > 1) THEN "big" ELSE "small" END AS w
FROM
  t_1_N AS t_0_N ORDER BY n NULLS LAST;