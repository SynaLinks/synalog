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
  AVG(Sale.amount) AS m
FROM
  t_1_Sale AS t_0_Sale, t_1_Sale AS Sale
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_Sale AS t_2_Sale
  WHERE
    (t_2_Sale.amount > 100) AND
    (Sale.id = t_2_Sale.id)) IS NULL) AND
  (t_0_Sale.region = "north") AND
  (Sale.id = t_0_Sale.id);