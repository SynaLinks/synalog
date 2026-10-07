WITH t_4_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_3_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_4_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_6_Teams AS (SELECT * FROM VALUES
  (10, "core"),
  (20, "infra"),
  (30, "data")
AS UNUSED_TABLE_NAME(team_id, team)),
t_5_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_6_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id NULLS LAST),
t_7_Events AS (SELECT * FROM VALUES
  (1, 10, "2022-01-01"),
  (1, 30, "2023-06-01"),
  (2, 10, "2021-03-01"),
  (4, 20, "2020-01-01"),
  (4, 10, "2024-02-01")
AS UNUSED_TABLE_NAME(person_id, team_id, changed_at)),
t_8_NextChange AS (SELECT
  t_9_Events.person_id AS person_id,
  t_9_Events.changed_at AS changed_at,
  MIN(t_10_Events.changed_at) AS next
FROM
  t_7_Events AS t_9_Events, t_7_Events AS t_10_Events
WHERE
  (t_10_Events.changed_at > t_9_Events.changed_at) AND
  (t_10_Events.person_id = t_9_Events.person_id)
GROUP BY 1, 2),
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
      "9999-12-31" AS valid_to
    FROM
      t_3_Person AS t_11_Person, t_5_Team AS t_12_Team, t_7_Events AS t_13_Events
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        t_8_NextChange AS t_16_NextChange
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
GROUP BY 1, 2, 3, 4)
SELECT
  Member.person_id AS person_id,
  Member.team_id AS team_id
FROM
  t_0_Member AS Member
WHERE
  (Member.valid_from <= "2023-01-01") AND
  ("2023-01-01" < Member.valid_to)
GROUP BY 1, 2 ORDER BY person_id NULLS LAST;