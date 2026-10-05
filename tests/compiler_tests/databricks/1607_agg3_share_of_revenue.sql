WITH t_1_Sale AS (SELECT * FROM VALUES
  (1, "north", "tea", 4, 30),
  (2, "north", "coffee", 2, 50),
  (3, "south", "tea", 6, 30),
  (4, "south", "cake", 1, 80),
  (5, "east", "coffee", 5, 50),
  (6, "east", "tea", 2, 30),
  (7, "north", "cake", 3, 80),
  (8, "west", "coffee", 4, 50),
  (9, "south", "coffee", 3, 50),
  (10, "east", "cake", 3, 80)
AS UNUSED_TABLE_NAME(id, region, item, qty, price)),
t_0_R AS (SELECT
  Sale.region AS region,
  SUM(((Sale.qty) * (Sale.price))) AS revenue
FROM
  t_1_Sale AS Sale
GROUP BY 1),
t_2_T AS (SELECT
  SUM(t_3_R.revenue) AS total
FROM
  t_0_R AS t_3_R)
SELECT
  R.region AS region,
  ROUND(((100) * (((R.revenue) / (T.total)))), 6) AS pct
FROM
  t_0_R AS R, t_2_T AS T ORDER BY region NULLS LAST, pct NULLS LAST;
