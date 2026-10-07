-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_Names AS (SELECT * FROM (
  
    SELECT
      'alice' AS name
   UNION ALL
  
    SELECT
      'alan' AS name
   UNION ALL
  
    SELECT
      'bob' AS name
   UNION ALL
  
    SELECT
      'albert' AS name
  
) AS UNUSED_TABLE_NAME  ),
t_0_StartsWithAl AS (SELECT
  Names.name AS name
FROM
  t_1_Names AS Names
WHERE
  (Names.name LIKE 'al%' ESCAPE '\') ORDER BY name)
SELECT
  StartsWithAl.name AS name
FROM
  t_0_StartsWithAl AS StartsWithAl ORDER BY name;
