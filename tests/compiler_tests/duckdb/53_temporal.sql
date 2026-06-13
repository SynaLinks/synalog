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
WITH t_1_Orders AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      E'2024-01-15 10:30:00' AS created_at
   UNION ALL
  
    SELECT
      2 AS id,
      E'2024-01-20 14:00:00' AS created_at
   UNION ALL
  
    SELECT
      3 AS id,
      E'2024-02-05 09:15:00' AS created_at
  
) AS UNUSED_TABLE_NAME  ),
t_0_MonthlyCount AS (SELECT
  SUBSTR(CAST(Orders.created_at AS TEXT), 1, 7) AS month,
  SUM(1) AS count
FROM
  t_1_Orders AS Orders
GROUP BY SUBSTR(CAST(Orders.created_at AS TEXT), 1, 7) ORDER BY month)
SELECT
  MonthlyCount.month AS month,
  MonthlyCount.count AS count
FROM
  t_0_MonthlyCount AS MonthlyCount ORDER BY month;