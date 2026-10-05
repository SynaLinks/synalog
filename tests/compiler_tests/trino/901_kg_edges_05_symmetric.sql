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
t_3_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_4_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id),
t_6_Mentoring AS (SELECT * FROM (
  
    SELECT
      2 AS mentor_id,
      5 AS mentee_id
   UNION ALL
  
    SELECT
      1 AS mentor_id,
      4 AS mentee_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_Mentors AS (SELECT
  Person.person_id AS mentor_id,
  t_2_Person.person_id AS mentee_id
FROM
  t_3_Person AS Person, t_3_Person AS t_2_Person, t_6_Mentoring AS Mentoring
WHERE
  (Mentoring.mentor_id = Person.person_id) AND
  (Mentoring.mentee_id = t_2_Person.person_id)
GROUP BY 1, 2),
t_0_Pair_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Mentors.mentor_id AS a,
      Mentors.mentee_id AS b
    FROM
      t_1_Mentors AS Mentors
   UNION ALL
  
    SELECT
      t_7_Mentors.mentee_id AS a,
      t_7_Mentors.mentor_id AS b
    FROM
      t_1_Mentors AS t_7_Mentors
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Pair_MultBodyAggAux.a AS a,
  Pair_MultBodyAggAux.b AS b
FROM
  t_0_Pair_MultBodyAggAux AS Pair_MultBodyAggAux
GROUP BY 1, 2 ORDER BY a, b;