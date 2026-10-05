WITH t_3_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_2_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_3_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_5_Teams AS (SELECT * FROM VALUES
  (10, "core"),
  (20, "infra"),
  (30, "data")
AS UNUSED_TABLE_NAME(team_id, team)),
t_4_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_5_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id NULLS LAST),
t_6_Events AS (SELECT * FROM VALUES
  (1, 10, "2022-01-01"),
  (1, 30, "2023-06-01"),
  (2, 10, "2021-03-01"),
  (4, 20, "2020-01-01"),
  (4, 10, "2024-02-01")
AS UNUSED_TABLE_NAME(person_id, team_id, changed_at)),
t_7_NextChange AS (SELECT
  t_8_Events.person_id AS person_id,
  t_8_Events.changed_at AS changed_at,
  MIN(t_9_Events.changed_at) AS next
FROM
  t_6_Events AS t_8_Events, t_6_Events AS t_9_Events
WHERE
  (t_9_Events.changed_at > t_8_Events.changed_at) AND
  (t_9_Events.person_id = t_8_Events.person_id)
GROUP BY 1, 2),
t_0_Member_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Person.person_id AS person_id,
      t_1_Team.team_id AS team_id,
      Events.changed_at AS valid_from,
      NextChange.next AS valid_to
    FROM
      t_2_Person AS Person, t_4_Team AS t_1_Team, t_6_Events AS Events, t_7_NextChange AS NextChange
    WHERE
      (Events.person_id = Person.person_id) AND
      (Events.team_id = t_1_Team.team_id) AND
      (NextChange.person_id = Person.person_id) AND
      (NextChange.changed_at = Events.changed_at)
   UNION ALL
  
    SELECT
      t_10_Person.person_id AS person_id,
      t_11_Team.team_id AS team_id,
      t_12_Events.changed_at AS valid_from,
      "9999-12-31" AS valid_to
    FROM
      t_2_Person AS t_10_Person, t_4_Team AS t_11_Team, t_6_Events AS t_12_Events
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        t_7_NextChange AS t_15_NextChange
      WHERE
        (t_15_NextChange.person_id = t_10_Person.person_id) AND
        (t_15_NextChange.changed_at = t_12_Events.changed_at)) IS NULL) AND
      (t_12_Events.person_id = t_10_Person.person_id) AND
      (t_12_Events.team_id = t_11_Team.team_id)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Member_MultBodyAggAux.person_id AS person_id,
  Member_MultBodyAggAux.team_id AS team_id,
  Member_MultBodyAggAux.valid_from AS valid_from,
  Member_MultBodyAggAux.valid_to AS valid_to
FROM
  t_0_Member_MultBodyAggAux AS Member_MultBodyAggAux
GROUP BY 1, 2, 3, 4 ORDER BY person_id NULLS LAST, valid_from NULLS LAST;