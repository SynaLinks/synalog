-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_1_Stock AS (SELECT * FROM (
  
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
t_0_Total AS (SELECT
  Stock.item AS item,
  SUM(Stock.qty) AS n
FROM
  t_1_Stock AS Stock
GROUP BY Stock.item),
t_2_Reorder AS (SELECT * FROM (
  
    SELECT
      'bolt' AS item,
      100 AS level
   UNION ALL
  
    SELECT
      'nut' AS item,
      60 AS level
   UNION ALL
  
    SELECT
      'gear' AS item,
      10 AS level
   UNION ALL
  
    SELECT
      'belt' AS item,
      10 AS level
   UNION ALL
  
    SELECT
      'chain' AS item,
      5 AS level
  
) AS UNUSED_TABLE_NAME  ),
t_3_Price AS (SELECT * FROM (
  
    SELECT
      'bolt' AS item,
      2 AS cents
   UNION ALL
  
    SELECT
      'nut' AS item,
      1 AS cents
   UNION ALL
  
    SELECT
      'gear' AS item,
      25 AS cents
   UNION ALL
  
    SELECT
      'belt' AS item,
      14 AS cents
   UNION ALL
  
    SELECT
      'chain' AS item,
      30 AS cents
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(((((Reorder.level) - (Total.n))) * (Price.cents))) AS c
FROM
  t_0_Total AS Total, t_2_Reorder AS Reorder, t_3_Price AS Price
WHERE
  (Total.n < Reorder.level) AND
  (Reorder.item = Total.item) AND
  (Price.item = Total.item);