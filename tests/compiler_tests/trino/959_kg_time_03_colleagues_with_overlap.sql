DROP TABLE IF EXISTS logica_test.Person;
CREATE TABLE logica_test.Person AS WITH t_0_Employees AS (SELECT * FROM (
  
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

-- Interacting with table logica_test.Person

DROP TABLE IF EXISTS logica_test.Team;
CREATE TABLE logica_test.Team AS WITH t_0_Teams AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_0_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id;

-- Interacting with table logica_test.Team

DROP TABLE IF EXISTS logica_test.NextChange;
CREATE TABLE logica_test.NextChange AS WITH t_1_Events AS (SELECT * FROM (
  
    SELECT
      1 AS person_id,
      10 AS team_id,
      '2022-01-01' AS changed_at
   UNION ALL
  
    SELECT
      1 AS person_id,
      30 AS team_id,
      '2023-06-01' AS changed_at
   UNION ALL
  
    SELECT
      2 AS person_id,
      10 AS team_id,
      '2021-03-01' AS changed_at
   UNION ALL
  
    SELECT
      4 AS person_id,
      20 AS team_id,
      '2020-01-01' AS changed_at
   UNION ALL
  
    SELECT
      4 AS person_id,
      10 AS team_id,
      '2024-02-01' AS changed_at
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Events.person_id AS person_id,
  Events.changed_at AS changed_at,
  MIN(t_0_Events.changed_at) AS next
FROM
  t_1_Events AS Events, t_1_Events AS t_0_Events
WHERE
  (t_0_Events.changed_at > Events.changed_at) AND
  (t_0_Events.person_id = Events.person_id)
GROUP BY 1, 2;

-- Interacting with table logica_test.NextChange

DROP TABLE IF EXISTS logica_test.Member;
CREATE TABLE logica_test.Member AS WITH t_1_Events AS (SELECT * FROM (
  
    SELECT
      1 AS person_id,
      10 AS team_id,
      '2022-01-01' AS changed_at
   UNION ALL
  
    SELECT
      1 AS person_id,
      30 AS team_id,
      '2023-06-01' AS changed_at
   UNION ALL
  
    SELECT
      2 AS person_id,
      10 AS team_id,
      '2021-03-01' AS changed_at
   UNION ALL
  
    SELECT
      4 AS person_id,
      20 AS team_id,
      '2020-01-01' AS changed_at
   UNION ALL
  
    SELECT
      4 AS person_id,
      10 AS team_id,
      '2024-02-01' AS changed_at
  
) AS UNUSED_TABLE_NAME  ),
t_0_Member_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Person.person_id AS person_id,
      Team.team_id AS team_id,
      Events.changed_at AS valid_from,
      NextChange.next AS valid_to
    FROM
      logica_test.Person AS Person, logica_test.Team AS Team, t_1_Events AS Events, logica_test.NextChange AS NextChange
    WHERE
      (Events.person_id = Person.person_id) AND
      (Events.team_id = Team.team_id) AND
      (NextChange.person_id = Person.person_id) AND
      (NextChange.changed_at = Events.changed_at)
   UNION ALL
  
    SELECT
      t_2_Person.person_id AS person_id,
      t_3_Team.team_id AS team_id,
      t_4_Events.changed_at AS valid_from,
      '9999-12-31' AS valid_to
    FROM
      logica_test.Person AS t_2_Person, logica_test.Team AS t_3_Team, t_1_Events AS t_4_Events
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        logica_test.NextChange AS t_5_NextChange
      WHERE
        (t_5_NextChange.person_id = t_2_Person.person_id) AND
        (t_5_NextChange.changed_at = t_4_Events.changed_at)) IS NULL) AND
      (t_4_Events.person_id = t_2_Person.person_id) AND
      (t_4_Events.team_id = t_3_Team.team_id)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Member_MultBodyAggAux.person_id AS person_id,
  Member_MultBodyAggAux.team_id AS team_id,
  Member_MultBodyAggAux.valid_from AS valid_from,
  Member_MultBodyAggAux.valid_to AS valid_to
FROM
  t_0_Member_MultBodyAggAux AS Member_MultBodyAggAux
GROUP BY 1, 2, 3, 4;

-- Interacting with table logica_test.Member

SELECT
  Member.person_id AS person_a,
  t_0_Member.person_id AS person_b,
  Member.team_id AS team_id,
  CASE WHEN (Member.valid_from > t_0_Member.valid_from) THEN Member.valid_from ELSE t_0_Member.valid_from END AS valid_from,
  CASE WHEN (Member.valid_to < t_0_Member.valid_to) THEN Member.valid_to ELSE t_0_Member.valid_to END AS valid_to
FROM
  logica_test.Member AS Member, logica_test.Member AS t_0_Member
WHERE
  (Member.person_id < t_0_Member.person_id) AND
  (CASE WHEN (Member.valid_from > t_0_Member.valid_from) THEN Member.valid_from ELSE t_0_Member.valid_from END < CASE WHEN (Member.valid_to < t_0_Member.valid_to) THEN Member.valid_to ELSE t_0_Member.valid_to END) AND
  (t_0_Member.team_id = Member.team_id)
GROUP BY 1, 2, 3, 4, 5 ORDER BY person_a, person_b, valid_from;