WITH t_1_Sale AS (SELECT * FROM (
  
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
  Sale.id AS id
FROM
  t_1_Sale AS Sale, t_1_Sale AS t_0_Sale
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_Sale AS t_2_Sale
  WHERE
    (t_2_Sale.region = "north") AND
    (Sale.id = t_2_Sale.id)) IS NULL) AND
  (t_0_Sale.amount > 100) AND
  (t_0_Sale.id = Sale.id) AND
  (Sale.product = "tea") ORDER BY id;