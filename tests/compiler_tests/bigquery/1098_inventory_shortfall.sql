WITH t_1_Stock AS (SELECT * FROM (
  
    SELECT
      "north" AS warehouse,
      "bolt" AS item,
      120 AS qty
   UNION ALL
  
    SELECT
      "north" AS warehouse,
      "nut" AS item,
      40 AS qty
   UNION ALL
  
    SELECT
      "north" AS warehouse,
      "gear" AS item,
      5 AS qty
   UNION ALL
  
    SELECT
      "south" AS warehouse,
      "bolt" AS item,
      30 AS qty
   UNION ALL
  
    SELECT
      "south" AS warehouse,
      "gear" AS item,
      12 AS qty
   UNION ALL
  
    SELECT
      "south" AS warehouse,
      "belt" AS item,
      7 AS qty
   UNION ALL
  
    SELECT
      "east" AS warehouse,
      "nut" AS item,
      15 AS qty
   UNION ALL
  
    SELECT
      "east" AS warehouse,
      "belt" AS item,
      2 AS qty
   UNION ALL
  
    SELECT
      "east" AS warehouse,
      "chain" AS item,
      9 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_0_Total AS (SELECT
  Stock.item AS item,
  SUM(Stock.qty) AS n
FROM
  t_1_Stock AS Stock
GROUP BY item),
t_2_Reorder AS (SELECT * FROM (
  
    SELECT
      "bolt" AS item,
      100 AS level
   UNION ALL
  
    SELECT
      "nut" AS item,
      60 AS level
   UNION ALL
  
    SELECT
      "gear" AS item,
      10 AS level
   UNION ALL
  
    SELECT
      "belt" AS item,
      10 AS level
   UNION ALL
  
    SELECT
      "chain" AS item,
      5 AS level
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Total.item AS item,
  ((Reorder.level) - (Total.n)) AS missing
FROM
  t_0_Total AS Total, t_2_Reorder AS Reorder
WHERE
  (Total.n < Reorder.level) AND
  (Reorder.item = Total.item) ORDER BY item, missing;