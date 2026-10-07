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
AS UNUSED_TABLE_NAME(id, region, item, qty, price))
SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(Sale.qty AS value, Sale.region AS arg)))[0].arg AS region
FROM
  t_1_Sale AS Sale
WHERE
  (Sale.item = "tea");
