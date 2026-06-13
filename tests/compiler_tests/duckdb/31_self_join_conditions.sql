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
WITH t_2_Employee AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      E'Alice' AS name,
      3 AS manager_id
   UNION ALL
  
    SELECT
      2 AS id,
      E'Bob' AS name,
      3 AS manager_id
   UNION ALL
  
    SELECT
      3 AS id,
      E'Charlie' AS name,
      4 AS manager_id
   UNION ALL
  
    SELECT
      4 AS id,
      E'David' AS name,
      4 AS manager_id
  
) AS UNUSED_TABLE_NAME  ),
t_0_ManagerPairs AS (SELECT
  Employee.name AS employee,
  t_1_Employee.name AS manager
FROM
  t_2_Employee AS Employee, t_2_Employee AS t_1_Employee
WHERE
  (t_1_Employee.id = Employee.manager_id) ORDER BY employee)
SELECT
  ManagerPairs.employee AS employee,
  ManagerPairs.manager AS manager
FROM
  t_0_ManagerPairs AS ManagerPairs ORDER BY employee;