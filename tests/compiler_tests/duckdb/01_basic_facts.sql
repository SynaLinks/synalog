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
WITH t_0_Employee AS (SELECT * FROM (
  
    SELECT
      'Alice' AS name,
      'Engineering' AS department,
      75000 AS salary
   UNION ALL
  
    SELECT
      'Bob' AS name,
      'Marketing' AS department,
      65000 AS salary
   UNION ALL
  
    SELECT
      'Charlie' AS name,
      'Engineering' AS department,
      80000 AS salary
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Employee.name AS name
FROM
  t_0_Employee AS Employee
WHERE
  (Employee.department = 'Engineering') ORDER BY name;