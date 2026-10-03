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
WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      'ann' AS name,
      1 AS city_id
   UNION ALL
  
    SELECT
      'bob' AS name,
      2 AS city_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_City AS (SELECT * FROM (
  
    SELECT
      1 AS city_id,
      'paris' AS city
   UNION ALL
  
    SELECT
      2 AS city_id,
      'rome' AS city
   UNION ALL
  
    SELECT
      3 AS city_id,
      'oslo' AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.name AS name,
  City.city AS city
FROM
  t_0_Person AS Person, t_1_City AS City
WHERE
  (City.city_id = Person.city_id) ORDER BY name;