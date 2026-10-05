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
WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      5 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'c' AS g,
      9 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_S AS (SELECT
  V.g AS g,
  SUM(V.x) AS t
FROM
  t_1_V AS V
GROUP BY V.g)
SELECT
  SUM(1) AS n
FROM
  t_0_S AS S
WHERE
  (S.t > 2);