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
  SORT_ARRAY(COLLECT_LIST(STRUCT(Sale.amount AS value, Sale.id AS arg)), false)[0].arg AS best
FROM
  t_1_Sale AS Sale
WHERE
  (Sale.amount < 60);