WITH t_2_Sale AS (SELECT * FROM VALUES
  (1, "north", "tea", 120),
  (2, "north", "cake", 40),
  (3, "south", "tea", 75),
  (4, "south", "coffee", 210),
  (5, "east", "cake", 55),
  (6, "east", "tea", 130),
  (7, "north", "coffee", 95),
  (8, "south", "cake", 20)
AS UNUSED_TABLE_NAME(id, region, product, amount)),
t_1_R AS (SELECT
  ARRAY_AGG(Sale.amount) AS l
FROM
  t_2_Sale AS Sale
WHERE
  (Sale.region = "south")),
t_3_T AS (SELECT
  SUM(x_10) AS t
FROM
  t_1_R AS t_4_R, LATERAL (SELECT explode(t_4_R.l) AS x_10) AS pushkin)
SELECT
  ARRAY_SIZE(R.l) AS n,
  t_0_T.t AS t
FROM
  t_1_R AS R, t_3_T AS t_0_T;