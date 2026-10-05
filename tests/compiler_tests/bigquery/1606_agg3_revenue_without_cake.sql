WITH t_0_Sale AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "north" AS region,
      "tea" AS item,
      4 AS qty,
      30 AS price
   UNION ALL
  
    SELECT
      2 AS id,
      "north" AS region,
      "coffee" AS item,
      2 AS qty,
      50 AS price
   UNION ALL
  
    SELECT
      3 AS id,
      "south" AS region,
      "tea" AS item,
      6 AS qty,
      30 AS price
   UNION ALL
  
    SELECT
      4 AS id,
      "south" AS region,
      "cake" AS item,
      1 AS qty,
      80 AS price
   UNION ALL
  
    SELECT
      5 AS id,
      "east" AS region,
      "coffee" AS item,
      5 AS qty,
      50 AS price
   UNION ALL
  
    SELECT
      6 AS id,
      "east" AS region,
      "tea" AS item,
      2 AS qty,
      30 AS price
   UNION ALL
  
    SELECT
      7 AS id,
      "north" AS region,
      "cake" AS item,
      3 AS qty,
      80 AS price
   UNION ALL
  
    SELECT
      8 AS id,
      "west" AS region,
      "coffee" AS item,
      4 AS qty,
      50 AS price
   UNION ALL
  
    SELECT
      9 AS id,
      "south" AS region,
      "coffee" AS item,
      3 AS qty,
      50 AS price
   UNION ALL
  
    SELECT
      10 AS id,
      "east" AS region,
      "cake" AS item,
      3 AS qty,
      80 AS price
  
) AS UNUSED_TABLE_NAME  ),
t_1_Cake AS (SELECT
  t_2_Sale.region AS region
FROM
  t_0_Sale AS t_2_Sale
WHERE
  (t_2_Sale.item = "cake")
GROUP BY region)
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
GROUP BY region;