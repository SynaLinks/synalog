WITH t_0_City AS (SELECT * FROM VALUES
  ("paris", "fr"),
  ("lyon", "fr")
AS UNUSED_TABLE_NAME(c, country)),
t_1_Shop AS (SELECT * FROM VALUES
  (1, "paris"),
  (2, "lyon")
AS UNUSED_TABLE_NAME(s, c)),
t_2_Sale AS (SELECT * FROM VALUES
  (1, 10),
  (2, 20)
AS UNUSED_TABLE_NAME(s, amount))
SELECT
  City.country AS country,
  SUM(Sale.amount) AS t
FROM
  t_0_City AS City, t_1_Shop AS Shop, t_2_Sale AS Sale
WHERE
  (Shop.c = City.c) AND
  (Sale.s = Shop.s)
GROUP BY 1;