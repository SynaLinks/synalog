WITH t_0_Sale AS (SELECT * FROM VALUES
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
t_1_Cake AS (SELECT
  t_2_Sale.region AS region
FROM
  t_0_Sale AS t_2_Sale
WHERE
  (t_2_Sale.item = "cake")
GROUP BY 1)
SELECT
  Sale.region AS region,
  SUM(((Sale.qty) * (Sale.price))) AS revenue
FROM
  t_0_Sale AS Sale
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_Cake AS Cake
  WHERE
    (Cake.region = Sale.region)) IS NULL)
GROUP BY 1;
