DROP TABLE IF EXISTS logica_test.In_table;
CREATE TABLE logica_test.In_table AS WITH t_0_Stock AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Stock.warehouse AS warehouse,
  Stock.item AS item
FROM
  t_0_Stock AS Stock
GROUP BY 1, 2;

-- Interacting with table logica_test.In_table

SELECT
  t_0_In.item AS item
FROM
  logica_test.In_table AS t_0_In
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.In_table AS t_1_In
  WHERE
    (t_1_In.warehouse = 'north') AND
    (t_1_In.item = t_0_In.item)) IS NULL) AND
  (t_0_In.warehouse = 'south');
