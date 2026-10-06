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
t_0_I AS (SELECT
  SUM(Sale.amount) AS t
FROM
  t_2_Sale AS Sale, t_2_Sale AS t_1_Sale
WHERE
  (t_1_Sale.region = "north") AND
  (Sale.id = t_1_Sale.id)),
t_3_O AS (SELECT
  SUM(t_4_Sale.amount) AS t
FROM
  t_2_Sale AS t_4_Sale
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_2_Sale AS t_6_Sale
  WHERE
    (t_6_Sale.region = "north") AND
    (t_4_Sale.id = t_6_Sale.id)) IS NULL))
SELECT
  I.t AS inside,
  O.t AS outside
FROM
  t_0_I AS I, t_3_O AS O;