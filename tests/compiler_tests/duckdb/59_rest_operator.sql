-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord922751334
drop type if exists logicarecord922751334 cascade; create type logicarecord922751334 as struct(a numeric, b numeric, c numeric);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_1_Record AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b,
      3 AS c
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b,
      6 AS c
  
) AS UNUSED_TABLE_NAME  ),
t_0_CopyAll AS (SELECT
  Record.*
FROM
  t_1_Record AS Record ORDER BY a)
SELECT
  CopyAll.a AS a,
  CopyAll.b AS b,
  CopyAll.c AS c
FROM
  t_0_CopyAll AS CopyAll ORDER BY a;