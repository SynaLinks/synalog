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
WITH t_1_Names AS (SELECT * FROM (
  
    SELECT
      E'alice' AS name
   UNION ALL
  
    SELECT
      E'alan' AS name
   UNION ALL
  
    SELECT
      E'bob' AS name
   UNION ALL
  
    SELECT
      E'albert' AS name
  
) AS UNUSED_TABLE_NAME  ),
t_0_StartsWithAl AS (SELECT
  Names.name AS name
FROM
  t_1_Names AS Names
WHERE
  (Names.name LIKE E'al%') ORDER BY name)
SELECT
  StartsWithAl.name AS name
FROM
  t_0_StartsWithAl AS StartsWithAl ORDER BY name;