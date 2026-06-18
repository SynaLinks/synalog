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
WITH t_1_Students AS (SELECT * FROM (
  
    SELECT
      'Alice' AS name,
      85 AS grade
   UNION ALL
  
    SELECT
      'Bob' AS name,
      72 AS grade
  
) AS UNUSED_TABLE_NAME  ),
t_2_Teachers AS (SELECT * FROM (
  
    SELECT
      'Prof Smith' AS name,
      'Math' AS department
   UNION ALL
  
    SELECT
      'Prof Jones' AS name,
      'Science' AS department
  
) AS UNUSED_TABLE_NAME  ),
t_0_People AS (SELECT * FROM (
  
    SELECT
      Students.name AS name,
      'student' AS role
    FROM
      t_1_Students AS Students
   UNION ALL
  
    SELECT
      Teachers.name AS name,
      'teacher' AS role
    FROM
      t_2_Teachers AS Teachers
  
) AS UNUSED_TABLE_NAME  )
SELECT
  People.name AS name,
  People.role AS role
FROM
  t_0_People AS People ORDER BY name;