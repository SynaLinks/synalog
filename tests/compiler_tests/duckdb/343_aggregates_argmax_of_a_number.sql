-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord884343024
drop type if exists logicarecord884343024 cascade; create type logicarecord884343024 as struct(arg numeric, value numeric);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);

-- Logica type: logicarecord723118000
drop type if exists logicarecord723118000 cascade; create type logicarecord723118000 as struct(a numeric, v numeric);
WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      10 AS id,
      1 AS s
   UNION ALL
  
    SELECT
      30 AS id,
      9 AS s
   UNION ALL
  
    SELECT
      20 AS id,
      5 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  argmax(V.id, V.s) AS w
FROM
  t_1_V AS V;