WITH t_3_Employees AS (SELECT * FROM (
  
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
t_1_Person AS (SELECT
  t_2_Employees.person_id AS person_id,
  t_2_Employees.name AS name,
  t_2_Employees.url AS url
FROM
  t_3_Employees AS t_2_Employees
GROUP BY t_2_Employees.person_id, t_2_Employees.name, t_2_Employees.url ORDER BY person_id NULLS LAST),
t_0_Active AS (SELECT
  Person.person_id AS person_id
FROM
  t_1_Person AS Person, t_3_Employees AS Employees
WHERE
  (Employees.person_id = Person.person_id) AND
  (Employees.status = 'active')
GROUP BY Person.person_id),
t_10_Teams AS (SELECT * FROM (
  
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
t_9_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_10_Teams AS Teams
GROUP BY Teams.team_id, Teams.team ORDER BY team_id NULLS LAST),
t_4_MemberOf AS (SELECT
  t_5_Person.person_id AS person_id,
  t_6_Team.team_id AS team_id
FROM
  t_1_Person AS t_5_Person, t_9_Team AS t_6_Team, t_3_Employees AS t_7_Employees
WHERE
  (t_7_Employees.person_id = t_5_Person.person_id) AND
  (t_7_Employees.team_id = t_6_Team.team_id)
GROUP BY t_5_Person.person_id, t_6_Team.team_id)
SELECT
  Active.person_id AS person_id
FROM
  t_0_Active AS Active, t_4_MemberOf AS MemberOf
WHERE
  (MemberOf.person_id = Active.person_id) AND
  (MemberOf.team_id = 10)
GROUP BY Active.person_id ORDER BY person_id NULLS LAST;