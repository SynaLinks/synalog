WITH t_3_N AS (SELECT * FROM VALUES
  (1),
  (2),
  (3)
AS UNUSED_TABLE_NAME(n))
SELECT
  SUM(1) AS k
FROM
  t_3_N AS t_0_N, t_3_N AS t_1_N, t_3_N AS t_2_N
WHERE
  (((t_0_N.n) + (t_1_N.n)) = t_2_N.n);