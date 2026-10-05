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
WITH t_1_In1 AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      1 AS v
   UNION ALL
  
    SELECT
      'x' AS g,
      3 AS v
   UNION ALL
  
    SELECT
      'y' AS g,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_T1 AS (SELECT
  In1.g AS g,
  SUM(In1.v) AS t
FROM
  t_1_In1 AS In1
GROUP BY In1.g)
SELECT
  T1.g AS g,
  T1.t AS t
FROM
  t_0_T1 AS T1 ORDER BY g;