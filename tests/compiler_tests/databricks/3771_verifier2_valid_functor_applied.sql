WITH t_2_N AS (SELECT * FROM VALUES
  (1, "x"),
  (2, "y"),
  (3, "z")
AS UNUSED_TABLE_NAME(n, s))
SELECT
  SUM(t_1_N.n) AS t
FROM
  t_2_N AS t_1_N
WHERE
  (t_1_N.n > 1);