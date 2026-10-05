WITH t_2_Sale AS (SELECT * FROM VALUES
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
t_1_R AS (SELECT
  Sale.region AS region,
  SUM(((Sale.qty) * (Sale.price))) AS revenue
FROM
  t_2_Sale AS Sale
GROUP BY 1)
SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(R.revenue AS value, R.region AS arg)), false)[0].arg AS region
FROM
  t_1_R AS R;
