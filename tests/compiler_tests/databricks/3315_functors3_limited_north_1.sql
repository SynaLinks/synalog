WITH t_0_Sale AS (SELECT * FROM VALUES
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
  Sale.id AS id,
  Sale.amount AS amount
FROM
  t_0_Sale AS Sale
WHERE
  (Sale.region = "north") ORDER BY amount desc LIMIT 1;