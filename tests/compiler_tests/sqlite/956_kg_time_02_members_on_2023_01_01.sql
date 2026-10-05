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
GROUP BY Employees.person_id, Employees.name, Employees.url ORDER BY person_id NULLS LAST),
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
GROUP BY Teams.team_id, Teams.team ORDER BY team_id NULLS LAST),
t_7_Events AS (SELECT * FROM (
  
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
t_8_NextChange AS (SELECT
  t_9_Events.person_id AS person_id,
  t_9_Events.changed_at AS changed_at,
  MIN(t_10_Events.changed_at) AS next
FROM
  t_7_Events AS t_9_Events, t_7_Events AS t_10_Events
WHERE
  (t_10_Events.changed_at > t_9_Events.changed_at) AND
  (t_10_Events.person_id = t_9_Events.person_id)
GROUP BY t_9_Events.person_id, t_9_Events.changed_at),
t_1_Member_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Person.person_id AS person_id,
      t_2_Team.team_id AS team_id,
      Events.changed_at AS valid_from,
      NextChange.next AS valid_to
    FROM
      t_3_Person AS Person, t_5_Team AS t_2_Team, t_7_Events AS Events, t_8_NextChange AS NextChange
    WHERE
      (Events.person_id = Person.person_id) AND
      (Events.team_id = t_2_Team.team_id) AND
      (NextChange.person_id = Person.person_id) AND
      (NextChange.changed_at = Events.changed_at)
   UNION ALL
  
    SELECT
      t_11_Person.person_id AS person_id,
      t_12_Team.team_id AS team_id,
      t_13_Events.changed_at AS valid_from,
      '9999-12-31' AS valid_to
    FROM
      t_3_Person AS t_11_Person, t_5_Team AS t_12_Team, t_7_Events AS t_13_Events
    WHERE
      ((SELECT
        MIN(MagicalEntangle(1, x_64.value)) AS logica_value
      FROM
        t_8_NextChange AS t_16_NextChange, JSON_EACH(JSON_ARRAY(0)) as x_64
      WHERE
        (t_16_NextChange.person_id = t_11_Person.person_id) AND
        (t_16_NextChange.changed_at = t_13_Events.changed_at)) IS NULL) AND
      (t_13_Events.person_id = t_11_Person.person_id) AND
      (t_13_Events.team_id = t_12_Team.team_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Member AS (SELECT
  Member_MultBodyAggAux.person_id AS person_id,
  Member_MultBodyAggAux.team_id AS team_id,
  Member_MultBodyAggAux.valid_from AS valid_from,
  Member_MultBodyAggAux.valid_to AS valid_to
FROM
  t_1_Member_MultBodyAggAux AS Member_MultBodyAggAux
GROUP BY Member_MultBodyAggAux.person_id, Member_MultBodyAggAux.team_id, Member_MultBodyAggAux.valid_from, Member_MultBodyAggAux.valid_to)
SELECT
  Member.person_id AS person_id,
  Member.team_id AS team_id
FROM
  t_0_Member AS Member
WHERE
  (Member.valid_from <= '2023-01-01') AND
  ('2023-01-01' < Member.valid_to)
GROUP BY Member.person_id, Member.team_id ORDER BY person_id NULLS LAST;