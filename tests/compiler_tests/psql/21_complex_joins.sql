-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_Users AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Alice' AS name,
      101 AS dept
   UNION ALL
  
    SELECT
      2 AS id,
      'Bob' AS name,
      102 AS dept
   UNION ALL
  
    SELECT
      3 AS id,
      'Charlie' AS name,
      101 AS dept
  
) AS UNUSED_TABLE_NAME  ),
t_1_Departments AS (SELECT * FROM (
  
    SELECT
      101 AS id,
      'Engineering' AS name
   UNION ALL
  
    SELECT
      102 AS id,
      'Marketing' AS name
   UNION ALL
  
    SELECT
      103 AS id,
      'Sales' AS name
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Users.name AS user_name,
  Departments.name AS dept_name
FROM
  t_0_Users AS Users, t_1_Departments AS Departments
WHERE
  (COALESCE(Departments.id, 0) = COALESCE(Users.dept, 0) AND (Departments.id IS NULL) = (Users.dept IS NULL)) ORDER BY user_name;