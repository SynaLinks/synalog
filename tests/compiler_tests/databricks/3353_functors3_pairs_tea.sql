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
  Sale.id AS a,
  t_1_Sale.id AS b
FROM
  t_2_Sale AS Sale, t_2_Sale AS t_1_Sale
WHERE
  (Sale.id < t_1_Sale.id) AND
  (((Sale.amount) + (t_1_Sale.amount)) > 200) AND
  (Sale.product = "tea") AND
  (t_1_Sale.product = "tea") ORDER BY a NULLS LAST, b NULLS LAST;