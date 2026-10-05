WITH t_2_Stock AS (SELECT * FROM (
  
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
t_1_N AS (SELECT
  Stock.item AS item,
  SUM(1) AS n
FROM
  t_2_Stock AS Stock
GROUP BY item)
SELECT
  t_0_N.item AS item
FROM
  t_1_N AS t_0_N
WHERE
  (t_0_N.n = 1);
