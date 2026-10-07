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
WITH t_1_S1 AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS v
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS v
   UNION ALL
  
    SELECT
      'b' AS g,
      4 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_R0 AS (SELECT
  S1.g AS g,
  SUM(S1.v) AS t
FROM
  t_1_S1 AS S1
GROUP BY S1.g)
SELECT
  R0.g AS g,
  R0.t AS t
FROM
  t_0_R0 AS R0 ORDER BY g;