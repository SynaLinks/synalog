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
WITH t_0_Sales AS (SELECT * FROM (
  
    SELECT
      'N' AS region,
      10 AS amount
   UNION ALL
  
    SELECT
      'N' AS region,
      20 AS amount
   UNION ALL
  
    SELECT
      'S' AS region,
      30 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (SELECT
  SUM((CASE WHEN x_6.unnested_pod = 0 THEN Sales.amount ELSE NULL END)) AS logica_value
FROM
  t_0_Sales AS Sales, (select unnest([0]::numeric[]) as unnested_pod) as x_6) AS total ORDER BY total;