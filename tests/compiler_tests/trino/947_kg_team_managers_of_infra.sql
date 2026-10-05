WITH t_4_Employees AS (SELECT * FROM (
  
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
t_2_Person AS (SELECT
  t_3_Employees.person_id AS person_id,
  t_3_Employees.name AS name,
  t_3_Employees.url AS url
FROM
  t_4_Employees AS t_3_Employees
GROUP BY 1, 2, 3 ORDER BY person_id),
t_6_Teams AS (SELECT * FROM (
  
    SELECT
      10 AS team_id,
      'core' AS team
   UNION ALL
  
    SELECT
      20 AS team_id,
      'infra' AS team
   UNION ALL
  
    SELECT
      30 AS team_id,
      'data' AS team
  
) AS UNUSED_TABLE_NAME  ),
t_5_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_6_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id),
t_0_MemberOf AS (SELECT
  Person.person_id AS person_id,
  t_1_Team.team_id AS team_id
FROM
  t_2_Person AS Person, t_5_Team AS t_1_Team, t_4_Employees AS Employees
WHERE
  (Employees.person_id = Person.person_id) AND
  (Employees.team_id = t_1_Team.team_id)
GROUP BY 1, 2),
t_11_Management AS (SELECT * FROM (
  
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
t_7_Manages AS (SELECT
  t_8_Person.person_id AS manager_id,
  t_9_Person.person_id AS employee_id
FROM
  t_2_Person AS t_8_Person, t_2_Person AS t_9_Person, t_11_Management AS Management
WHERE
  (Management.manager_id = t_8_Person.person_id) AND
  (Management.employee_id = t_9_Person.person_id)
GROUP BY 1, 2)
SELECT
  Manages.manager_id AS manager_id
FROM
  t_0_MemberOf AS MemberOf, t_7_Manages AS Manages
WHERE
  (MemberOf.team_id = 20) AND
  (Manages.employee_id = MemberOf.person_id)
GROUP BY 1 ORDER BY manager_id;