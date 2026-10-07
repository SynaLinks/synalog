WITH t_3_N AS (SELECT * FROM VALUES
  (1, "x"),
  (2, "y"),
  (3, "z")
AS UNUSED_TABLE_NAME(n, s)),
t_1_Order AS (SELECT
  t_2_N.n AS n
FROM
  t_3_N AS t_2_N ORDER BY n NULLS LAST)
SELECT
  t_0_Order.n AS n
FROM
  t_1_Order AS t_0_Order
WHERE
  (t_0_Order.n > 2);