WITH t_3_Sale AS (SELECT * FROM VALUES
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
t_0_A AS (SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(Sale.qty AS arg, Sale.id AS value))), s -> s.value) AS l
FROM
  t_3_Sale AS Sale
WHERE
  (Sale.region = "south"))
SELECT
  ELEMENT_AT(A.l, 0 + 1) AS first,
  ARRAY_SIZE(A.l) AS n
FROM
  t_0_A AS A;
