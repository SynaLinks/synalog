-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_Person AS (SELECT * FROM (
  
    SELECT
      'ann' AS name,
      1 AS city_id
   UNION ALL
  
    SELECT
      'bob' AS name,
      2 AS city_id
  
) AS UNUSED_TABLE_NAME  ),
t_2_City AS (SELECT * FROM (
  
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
  t_0_City.city AS city
FROM
  t_1_Person AS Person, t_2_City AS t_0_City
WHERE
  (t_0_City.city_id = Person.city_id) ORDER BY name;