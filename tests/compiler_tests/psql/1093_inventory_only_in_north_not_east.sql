-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

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
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_1_In AS t_3_In, UNNEST(ARRAY[0]) as x_10
  WHERE
    (t_3_In.warehouse = 'east') AND
    (t_3_In.item = t_0_In.item)) AS numeric) IS NULL) AND
  (t_0_In.warehouse = 'north') ORDER BY item;
