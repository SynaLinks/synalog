-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord6083990
drop type if exists logicarecord6083990 cascade; create type logicarecord6083990 as struct(x numeric, y numeric);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_0_Rate AS (SELECT * FROM (
  
    SELECT
      'ab' AS s,
      2 AS r
   UNION ALL
  
    SELECT
      'hello' AS s,
      5 AS r
   UNION ALL
  
    SELECT
      'x' AS s,
      10 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Rate.r AS v
FROM
  t_0_Rate AS Rate
WHERE
  ('hello' = Rate.s);