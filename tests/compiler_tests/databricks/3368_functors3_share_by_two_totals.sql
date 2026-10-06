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
t_0_Tt AS (SELECT
  SUM(Sale.amount) AS t
FROM
  t_1_Sale AS Sale
WHERE
  (Sale.product = "tea")),
t_2_Ta AS (SELECT
  SUM(t_4_Sale.amount) AS t
FROM
  t_1_Sale AS t_4_Sale)
SELECT
  ((Tt.t) / NULLIF(Ta.t, 0)) AS share
FROM
  t_0_Tt AS Tt, t_2_Ta AS Ta;