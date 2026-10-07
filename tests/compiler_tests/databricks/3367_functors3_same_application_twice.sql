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
t_0_R1 AS (SELECT
  SUM(Sale.amount) AS t
FROM
  t_1_Sale AS Sale
WHERE
  (Sale.product = "tea")),
t_2_R2 AS (SELECT
  SUM(t_4_Sale.amount) AS t
FROM
  t_1_Sale AS t_4_Sale
WHERE
  (t_4_Sale.product = "tea"))
SELECT
  1 AS x
FROM
  t_0_R1 AS R1, t_2_R2 AS R2
WHERE
  (R1.t = R2.t);