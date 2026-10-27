DROP TABLE IF EXISTS synalog_test.Person;
CREATE TABLE synalog_test.Person AS WITH t_0_Employees AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_0_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id;

-- Interacting with table synalog_test.Person

DROP TABLE IF EXISTS synalog_test.InDept;
CREATE TABLE synalog_test.InDept AS WITH t_0_Employees AS (SELECT * FROM (
  
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
t_0_Dept AS (SELECT
  t_1_Employees.dept AS dept
FROM
  t_0_Employees AS t_1_Employees
GROUP BY 1)
SELECT
  Person.person_id AS person_id,
  Dept.dept AS dept
FROM
  synalog_test.Person AS Person, t_0_Dept AS Dept, t_0_Employees AS Employees
WHERE
  (Employees.person_id IS NOT DISTINCT FROM Person.person_id) AND
  (Employees.dept IS NOT DISTINCT FROM Dept.dept)
GROUP BY 1, 2;

-- Interacting with table synalog_test.InDept

SELECT
  t_0_InDept.person_id AS person_id
FROM
  synalog_test.InDept AS InDept, synalog_test.InDept AS t_0_InDept
WHERE
  (t_0_InDept.person_id IS DISTINCT FROM 3) AND
  (InDept.person_id = 3) AND
  (t_0_InDept.dept IS NOT DISTINCT FROM InDept.dept)
GROUP BY 1 ORDER BY person_id;