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
WITH t_1_Sales AS (SELECT * FROM (
  
    SELECT
      E'Electronics' AS category,
      500 AS amount
   UNION ALL
  
    SELECT
      E'Electronics' AS category,
      300 AS amount
   UNION ALL
  
    SELECT
      E'Books' AS category,
      50 AS amount
   UNION ALL
  
    SELECT
      E'Books' AS category,
      75 AS amount
   UNION ALL
  
    SELECT
      E'Clothing' AS category,
      200 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_0_CategorySummary AS (SELECT
  Sales.category AS category,
  SUM(Sales.amount) AS total,
  SUM(CASE WHEN (Sales.amount >= 200) THEN 1 ELSE 0 END) AS high_value_count
FROM
  t_1_Sales AS Sales
GROUP BY Sales.category ORDER BY category)
SELECT
  CategorySummary.category AS category,
  CategorySummary.total AS total,
  CategorySummary.high_value_count AS high_value_count
FROM
  t_0_CategorySummary AS CategorySummary ORDER BY category;