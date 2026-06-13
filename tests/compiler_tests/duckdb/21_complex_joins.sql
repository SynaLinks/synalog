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
WITH t_0_Users AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      E'Alice' AS name,
      101 AS dept
   UNION ALL
  
    SELECT
      2 AS id,
      E'Bob' AS name,
      102 AS dept
   UNION ALL
  
    SELECT
      3 AS id,
      E'Charlie' AS name,
      101 AS dept
  
) AS UNUSED_TABLE_NAME  ),
t_1_Departments AS (SELECT * FROM (
  
    SELECT
      101 AS id,
      E'Engineering' AS name
   UNION ALL
  
    SELECT
      102 AS id,
      E'Marketing' AS name
   UNION ALL
  
    SELECT
      103 AS id,
      E'Sales' AS name
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Users.name AS user_name,
  Departments.name AS dept_name
FROM
  t_0_Users AS Users, t_1_Departments AS Departments
WHERE
  (Departments.id = Users.dept) ORDER BY user_name;