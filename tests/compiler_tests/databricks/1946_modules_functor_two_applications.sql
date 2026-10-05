WITH t_3_Mine AS (SELECT * FROM VALUES
  (4),
  (9),
  (1)
AS UNUSED_TABLE_NAME(x)),
t_2_A AS (SELECT
  SUM(Mine.x) AS t
FROM
  t_3_Mine AS Mine),
t_5_Shop_Product AS (SELECT * FROM VALUES
  ("a1", "pen", 2),
  ("a2", "pad", 5),
  ("b1", "lamp", 30),
  ("b2", "desk", 120),
  ("c1", "mug", 8)
AS UNUSED_TABLE_NAME(sku, name, price)),
t_4_B AS (SELECT
  SUM(Shop_Product.price) AS t
FROM
  t_5_Shop_Product AS Shop_Product)
SELECT
  t_0_A.t AS a,
  t_1_B.t AS b
FROM
  t_2_A AS t_0_A, t_4_B AS t_1_B;
