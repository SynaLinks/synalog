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
t_7_Teams AS (SELECT * FROM (
  
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
t_6_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_7_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id),
t_1_MemberOf AS (SELECT
  Person.person_id AS person_id,
  t_2_Team.team_id AS team_id
FROM
  t_3_Person AS Person, t_6_Team AS t_2_Team, t_5_Employees AS Employees
WHERE
  (Employees.person_id = Person.person_id) AND
  (Employees.team_id = t_2_Team.team_id)
GROUP BY 1, 2)
SELECT
  t_0_MemberOf.person_id AS person_id
FROM
  t_1_MemberOf AS MemberOf, t_1_MemberOf AS t_0_MemberOf
WHERE
  (t_0_MemberOf.person_id != 3) AND
  (MemberOf.person_id = 3) AND
  (t_0_MemberOf.team_id = MemberOf.team_id)
GROUP BY 1 ORDER BY person_id;