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
t_0_R AS (SELECT
  Sale.region AS region,
  SUM(((Sale.qty) * (Sale.price))) AS revenue
FROM
  t_1_Sale AS Sale
GROUP BY region),
t_2_T AS (SELECT
  SUM(t_3_R.revenue) AS total
FROM
  t_0_R AS t_3_R)
SELECT
  R.region AS region,
  ROUND(((100) * (((R.revenue) / (T.total)))), 6) AS pct
FROM
  t_0_R AS R, t_2_T AS T ORDER BY region, pct;