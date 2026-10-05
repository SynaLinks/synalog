WITH t_1_Sale AS (SELECT * FROM (
  
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
t_0_RI AS (SELECT
  Sale.region AS region,
  Sale.item AS item
FROM
  t_1_Sale AS Sale
GROUP BY region, item)
SELECT
  RI.region AS region,
  SUM(1) AS n
FROM
  t_0_RI AS RI
GROUP BY region ORDER BY region, n;