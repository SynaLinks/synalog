-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_Employees AS (SELECT * FROM (
  
    SELECT
      1 AS person_id,
      'ann' AS name,
      'eng' AS dept,
      10 AS team_id,
      'active' AS status,
      'https://x/ann' AS url
   UNION ALL
  
    SELECT
      2 AS person_id,
      'bob' AS name,
      'eng' AS dept,
      10 AS team_id,
      'active' AS status,
      'https://x/bob' AS url
   UNION ALL
  
    SELECT
      3 AS person_id,
      'cid' AS name,
      'ops' AS dept,
      20 AS team_id,
      'inactive' AS status,
      'https://x/cid' AS url
   UNION ALL
  
    SELECT
      4 AS person_id,
      'dan' AS name,
      'ops' AS dept,
      20 AS team_id,
      'active' AS status,
      'https://x/dan' AS url
   UNION ALL
  
    SELECT
      5 AS person_id,
      'eve' AS name,
      'eng' AS dept,
      30 AS team_id,
      'active' AS status,
      'https://x/eve' AS url
  
) AS UNUSED_TABLE_NAME  ),
t_0_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_1_Employees AS Employees
GROUP BY Employees.person_id, Employees.name, Employees.url ORDER BY person_id),
t_6_Management AS (SELECT * FROM (
  
    SELECT
      1 AS manager_id,
      2 AS employee_id
   UNION ALL
  
    SELECT
      1 AS manager_id,
      5 AS employee_id
   UNION ALL
  
    SELECT
      4 AS manager_id,
      3 AS employee_id
   UNION ALL
  
    SELECT
      2 AS manager_id,
      6 AS employee_id
  
) AS UNUSED_TABLE_NAME  ),
t_2_Manages AS (SELECT
  t_3_Person.person_id AS manager_id,
  t_4_Person.person_id AS employee_id
FROM
  t_0_Person AS t_3_Person, t_0_Person AS t_4_Person, t_6_Management AS Management
WHERE
  (COALESCE(Management.manager_id, 0) = COALESCE(t_3_Person.person_id, 0) AND (Management.manager_id IS NULL) = (t_3_Person.person_id IS NULL)) AND
  (COALESCE(Management.employee_id, 0) = COALESCE(t_4_Person.person_id, 0) AND (Management.employee_id IS NULL) = (t_4_Person.person_id IS NULL))
GROUP BY t_3_Person.person_id, t_4_Person.person_id)
SELECT
  Person.person_id AS person_id
FROM
  t_0_Person AS Person
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_2_Manages AS Manages, UNNEST(ARRAY[0]) as x_10
  WHERE
    (COALESCE(Manages.employee_id, 0) = COALESCE(Person.person_id, 0) AND (Manages.employee_id IS NULL) = (Person.person_id IS NULL))) AS numeric) IS NULL) ORDER BY person_id;