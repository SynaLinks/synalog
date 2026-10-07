WITH t_1_Sale AS (SELECT * FROM VALUES
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
  Sale.id AS id
FROM
  t_1_Sale AS Sale, t_1_Sale AS t_0_Sale
WHERE
  (t_0_Sale.amount < 60) AND
  (t_0_Sale.id = Sale.id) AND
  (Sale.region = "east") ORDER BY id NULLS LAST;