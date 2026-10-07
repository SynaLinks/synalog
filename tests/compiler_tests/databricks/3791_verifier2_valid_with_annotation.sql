WITH t_2_N AS (SELECT * FROM VALUES
  (1, "x"),
  (2, "y"),
  (3, "z")
AS UNUSED_TABLE_NAME(n, s)),
t_0_W AS (SELECT
  t_1_N.n AS n
FROM
  t_2_N AS t_1_N)
SELECT
  SUM(1) AS c
FROM
  t_0_W AS W;