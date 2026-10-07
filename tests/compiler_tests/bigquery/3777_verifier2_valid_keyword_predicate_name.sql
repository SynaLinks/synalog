WITH t_3_N AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      "x" AS s
   UNION ALL
  
    SELECT
      2 AS n,
      "y" AS s
   UNION ALL
  
    SELECT
      3 AS n,
      "z" AS s
  
) AS UNUSED_TABLE_NAME  ),
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