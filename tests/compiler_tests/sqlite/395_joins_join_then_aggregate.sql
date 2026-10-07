WITH t_0_City AS (SELECT * FROM (
  
    SELECT
      'paris' AS c,
      'fr' AS country
   UNION ALL
  
    SELECT
      'lyon' AS c,
      'fr' AS country
  
) AS UNUSED_TABLE_NAME  ),
t_1_Shop AS (SELECT * FROM (
  
    SELECT
      1 AS s,
      'paris' AS c
   UNION ALL
  
    SELECT
      2 AS s,
      'lyon' AS c
  
) AS UNUSED_TABLE_NAME  ),
t_2_Sale AS (SELECT * FROM (
  
    SELECT
      1 AS s,
      10 AS amount
   UNION ALL
  
    SELECT
      2 AS s,
      20 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT
  City.country AS country,
  SUM(Sale.amount) AS t
FROM
  t_0_City AS City, t_1_Shop AS Shop, t_2_Sale AS Sale
WHERE
  (Shop.c = City.c) AND
  (Sale.s = Shop.s)
GROUP BY City.country;