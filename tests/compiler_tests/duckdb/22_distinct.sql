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
WITH t_1_Data AS (SELECT * FROM (
  
    SELECT
      'A' AS category,
      1 AS value
   UNION ALL
  
    SELECT
      'A' AS category,
      2 AS value
   UNION ALL
  
    SELECT
      'A' AS category,
      1 AS value
   UNION ALL
  
    SELECT
      'B' AS category,
      1 AS value
   UNION ALL
  
    SELECT
      'B' AS category,
      1 AS value
  
) AS UNUSED_TABLE_NAME  ),
t_0_UniqueCategories AS (SELECT
  Data.category AS category
FROM
  t_1_Data AS Data
GROUP BY Data.category ORDER BY category)
SELECT
  UniqueCategories.category AS category
FROM
  t_0_UniqueCategories AS UniqueCategories ORDER BY category;