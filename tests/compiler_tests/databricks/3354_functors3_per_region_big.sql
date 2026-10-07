WITH t_1_Sale AS (SELECT * FROM VALUES
  (1, "north", "tea", 120),
  (2, "north", "cake", 40),
  (3, "south", "tea", 75),
  (4, "south", "coffee", 210),
  (5, "east", "cake", 55),
  (6, "east", "tea", 130),
  (7, "north", "coffee", 95),
  (8, "south", "cake", 20)
AS UNUSED_TABLE_NAME(id, region, product, amount)),
t_0_R AS (SELECT
  Sale.region AS region,
  SUM(Sale.amount) AS t
FROM
  t_1_Sale AS Sale
WHERE
  (Sale.amount > 100)
GROUP BY 1)
SELECT
  R.region AS region,
  R.t AS t
FROM
  t_0_R AS R ORDER BY region NULLS LAST;