WITH t_5_Employees AS (SELECT * FROM (
  
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
t_3_Person AS (SELECT
  t_4_Employees.person_id AS person_id,
  t_4_Employees.name AS name,
  t_4_Employees.url AS url
FROM
  t_5_Employees AS t_4_Employees
GROUP BY 1, 2, 3 ORDER BY person_id),
t_6_Dept AS (SELECT
  t_7_Employees.dept AS dept
FROM
  t_5_Employees AS t_7_Employees
GROUP BY 1),
t_1_InDept AS (SELECT
  Person.person_id AS person_id,
  t_2_Dept.dept AS dept
FROM
  t_3_Person AS Person, t_6_Dept AS t_2_Dept, t_5_Employees AS Employees
WHERE
  (Employees.person_id = Person.person_id) AND
  (Employees.dept = t_2_Dept.dept)
GROUP BY 1, 2)
SELECT
  t_0_InDept.person_id AS person_id
FROM
  t_1_InDept AS InDept, t_1_InDept AS t_0_InDept
WHERE
  (t_0_InDept.person_id != 4) AND
  (InDept.person_id = 4) AND
  (t_0_InDept.dept = InDept.dept)
GROUP BY 1 ORDER BY person_id;