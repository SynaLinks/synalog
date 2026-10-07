WITH t_2_Stock AS (SELECT * FROM (
  
    SELECT
      'north' AS warehouse,
      'bolt' AS item,
      120 AS qty
   UNION ALL
  
    SELECT
      'north' AS warehouse,
      'nut' AS item,
      40 AS qty
   UNION ALL
  
    SELECT
      'north' AS warehouse,
      'gear' AS item,
      5 AS qty
   UNION ALL
  
    SELECT
      'south' AS warehouse,
      'bolt' AS item,
      30 AS qty
   UNION ALL
  
    SELECT
      'south' AS warehouse,
      'gear' AS item,
      12 AS qty
   UNION ALL
  
    SELECT
      'south' AS warehouse,
      'belt' AS item,
      7 AS qty
   UNION ALL
  
    SELECT
      'east' AS warehouse,
      'nut' AS item,
      15 AS qty
   UNION ALL
  
    SELECT
      'east' AS warehouse,
      'belt' AS item,
      2 AS qty
   UNION ALL
  
    SELECT
      'east' AS warehouse,
      'chain' AS item,
      9 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_In AS (SELECT
  Stock.warehouse AS warehouse,
  Stock.item AS item
FROM
  t_2_Stock AS Stock
GROUP BY Stock.warehouse, Stock.item)
SELECT
  t_0_In.item AS item
FROM
  t_1_In AS t_0_In
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_10.value)) AS logica_value
  FROM
    t_1_In AS t_3_In, JSON_EACH(JSON_ARRAY(0)) as x_10
  WHERE
    (t_3_In.warehouse = 'north') AND
    (t_3_In.item = t_0_In.item)) IS NULL) AND
  (t_0_In.warehouse = 'south');
