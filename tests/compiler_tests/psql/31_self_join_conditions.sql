-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_Employee AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Alice' AS name,
      3 AS manager_id
   UNION ALL
  
    SELECT
      2 AS id,
      'Bob' AS name,
      3 AS manager_id
   UNION ALL
  
    SELECT
      3 AS id,
      'Charlie' AS name,
      4 AS manager_id
   UNION ALL
  
    SELECT
      4 AS id,
      'David' AS name,
      4 AS manager_id
  
) AS UNUSED_TABLE_NAME  ),
t_0_ManagerPairs AS (SELECT
  t_1_Employee.name AS employee,
  t_2_Employee.name AS manager
FROM
  t_3_Employee AS t_1_Employee, t_3_Employee AS t_2_Employee
WHERE
  (COALESCE(t_2_Employee.id, 0) = COALESCE(t_1_Employee.manager_id, 0) AND (t_2_Employee.id IS NULL) = (t_1_Employee.manager_id IS NULL)) ORDER BY employee)
SELECT
  ManagerPairs.employee AS employee,
  ManagerPairs.manager AS manager
FROM
  t_0_ManagerPairs AS ManagerPairs ORDER BY employee;