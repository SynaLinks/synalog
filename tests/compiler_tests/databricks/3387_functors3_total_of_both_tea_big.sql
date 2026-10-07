WITH t_2_Sale AS (SELECT * FROM VALUES
  (1, "north", "tea", 120),
  (2, "north", "cake", 40),
  (3, "south", "tea", 75),
  (4, "south", "coffee", 210),
  (5, "east", "cake", 55),
  (6, "east", "tea", 130),
  (7, "north", "coffee", 95),
  (8, "south", "cake", 20)
AS UNUSED_TABLE_NAME(id, region, product, amount))
SELECT
  SUM(Sale.amount) AS t
FROM
  t_2_Sale AS t_0_Sale, t_2_Sale AS t_1_Sale, t_2_Sale AS Sale
WHERE
  (t_1_Sale.amount > 100) AND
  (t_1_Sale.id = Sale.id) AND
  (t_0_Sale.product = "tea") AND
  (Sale.id = t_0_Sale.id);