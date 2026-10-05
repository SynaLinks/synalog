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
WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1.5 AS x,
      42 AS y,
      null AS z
   UNION ALL
  
    SELECT
      2.5 AS x,
      7 AS y,
      1 AS z
  
) AS UNUSED_TABLE_NAME  )
SELECT
  CAST(V.x AS TEXT) AS a,
  CAST(V.y AS TEXT) AS b,
  CAST(V.z AS TEXT) AS c
FROM
  t_0_V AS V
WHERE
  (V.x < 2);