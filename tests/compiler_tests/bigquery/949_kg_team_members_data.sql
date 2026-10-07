WITH t_2_Teams AS (SELECT * FROM (
  
    SELECT
      10 AS team_id,
      "core" AS team
   UNION ALL
  
    SELECT
      20 AS team_id,
      "infra" AS team
   UNION ALL
  
    SELECT
      30 AS team_id,
      "data" AS team
  
) AS UNUSED_TABLE_NAME  ),
t_1_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_2_Teams AS Teams
GROUP BY team_id, team ORDER BY team_id NULLS LAST),
t_8_Employees AS (SELECT * FROM (
  
    SELECT
      1 AS person_id,
      "ann" AS name,
      "eng" AS dept,
      10 AS team_id,
      "active" AS status,
      "https://x/ann" AS url
   UNION ALL
  
    SELECT
      2 AS person_id,
      "bob" AS name,
      "eng" AS dept,
      10 AS team_id,
      "active" AS status,
      "https://x/bob" AS url
   UNION ALL
  
    SELECT
      3 AS person_id,
      "cid" AS name,
      "ops" AS dept,
      20 AS team_id,
      "inactive" AS status,
      "https://x/cid" AS url
   UNION ALL
  
    SELECT
      4 AS person_id,
      "dan" AS name,
      "ops" AS dept,
      20 AS team_id,
      "active" AS status,
      "https://x/dan" AS url
   UNION ALL
  
    SELECT
      5 AS person_id,
      "eve" AS name,
      "eng" AS dept,
      30 AS team_id,
      "active" AS status,
      "https://x/eve" AS url
  
) AS UNUSED_TABLE_NAME  ),
t_6_Person AS (SELECT
  t_7_Employees.person_id AS person_id,
  t_7_Employees.name AS name,
  t_7_Employees.url AS url
FROM
  t_8_Employees AS t_7_Employees
GROUP BY person_id, name, url ORDER BY person_id NULLS LAST),
t_3_MemberOf AS (SELECT
  t_4_Person.person_id AS person_id,
  t_5_Team.team_id AS team_id
FROM
  t_6_Person AS t_4_Person, t_1_Team AS t_5_Team, t_8_Employees AS Employees
WHERE
  (Employees.person_id = t_4_Person.person_id) AND
  (Employees.team_id = t_5_Team.team_id)
GROUP BY person_id, team_id)
SELECT
  MemberOf.person_id AS person_id,
  Person.name AS name
FROM
  t_1_Team AS t_0_Team, t_3_MemberOf AS MemberOf, t_6_Person AS Person
WHERE
  (t_0_Team.team_id = 30) AND
  (MemberOf.team_id = 30) AND
  (Person.person_id = MemberOf.person_id)
GROUP BY person_id, name ORDER BY person_id NULLS LAST;