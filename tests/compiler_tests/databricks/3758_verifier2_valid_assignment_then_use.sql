WITH t_1_N AS (SELECT * FROM VALUES
  (1, "x"),
  (2, "y"),
  (3, "z")
AS UNUSED_TABLE_NAME(n, s))
SELECT
  t_0_N.n AS n,
  ((t_0_N.n) * (2)) AS d
FROM
  t_1_N AS t_0_N
WHERE
  (((t_0_N.n) * (2)) > 2) ORDER BY n NULLS LAST;