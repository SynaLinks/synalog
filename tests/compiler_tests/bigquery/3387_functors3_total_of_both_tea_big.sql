WITH t_2_Sale AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "north" AS region,
      "tea" AS product,
      120 AS amount
   UNION ALL
  
    SELECT
      2 AS id,
      "north" AS region,
      "cake" AS product,
      40 AS amount
   UNION ALL
  
    SELECT
      3 AS id,
      "south" AS region,
      "tea" AS product,
      75 AS amount
   UNION ALL
  
    SELECT
      4 AS id,
      "south" AS region,
      "coffee" AS product,
      210 AS amount
   UNION ALL
  
    SELECT
      5 AS id,
      "east" AS region,
      "cake" AS product,
      55 AS amount
   UNION ALL
  
    SELECT
      6 AS id,
      "east" AS region,
      "tea" AS product,
      130 AS amount
   UNION ALL
  
    SELECT
      7 AS id,
      "north" AS region,
      "coffee" AS product,
      95 AS amount
   UNION ALL
  
    SELECT
      8 AS id,
      "south" AS region,
      "cake" AS product,
      20 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(Sale.amount) AS t
FROM
  t_2_Sale AS t_0_Sale, t_2_Sale AS t_1_Sale, t_2_Sale AS Sale
WHERE
  (t_1_Sale.amount > 100) AND
  (t_1_Sale.id = Sale.id) AND
  (t_0_Sale.product = "tea") AND
  (Sale.id = t_0_Sale.id);