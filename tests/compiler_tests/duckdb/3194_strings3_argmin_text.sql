-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord131327099
drop type if exists logicarecord131327099 cascade; create type logicarecord131327099 as struct(arg numeric, value text);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);

-- Logica type: logicarecord717713137
drop type if exists logicarecord717713137 cascade; create type logicarecord717713137 as struct(a numeric, v text);
WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'b' AS w
   UNION ALL
  
    SELECT
      2 AS id,
      'B' AS w
   UNION ALL
  
    SELECT
      3 AS id,
      'c' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  argmin(V.id, V.w) AS id
FROM
  t_1_V AS V;