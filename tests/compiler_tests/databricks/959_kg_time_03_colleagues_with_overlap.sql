WITH t_5_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_7_Teams AS (SELECT * FROM VALUES
  (10, "core"),
  (20, "infra"),
  (30, "data")
AS UNUSED_TABLE_NAME(team_id, team)),
t_6_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_7_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id NULLS LAST),
t_8_Events AS (SELECT * FROM VALUES
  (1, 10, "2022-01-01"),
  (1, 30, "2023-06-01"),
  (2, 10, "2021-03-01"),
  (4, 20, "2020-01-01"),
  (4, 10, "2024-02-01")
AS UNUSED_TABLE_NAME(person_id, team_id, changed_at)),
t_9_NextChange AS (SELECT
  t_10_Events.person_id AS person_id,
  t_10_Events.changed_at AS changed_at,
  MIN(t_11_Events.changed_at) AS next
FROM
  t_8_Events AS t_10_Events, t_8_Events AS t_11_Events
WHERE
  (t_11_Events.changed_at > t_10_Events.changed_at) AND
  (t_11_Events.person_id = t_10_Events.person_id)
GROUP BY 1, 2),
t_2_Member_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Person.person_id AS person_id,
      t_3_Team.team_id AS team_id,
      Events.changed_at AS valid_from,
      NextChange.next AS valid_to
    FROM
      t_4_Person AS Person, t_6_Team AS t_3_Team, t_8_Events AS Events, t_9_NextChange AS NextChange
    WHERE
      (Events.person_id = Person.person_id) AND
      (Events.team_id = t_3_Team.team_id) AND
      (NextChange.person_id = Person.person_id) AND
      (NextChange.changed_at = Events.changed_at)
   UNION ALL
  
    SELECT
      t_12_Person.person_id AS person_id,
      t_13_Team.team_id AS team_id,
      t_14_Events.changed_at AS valid_from,
      "9999-12-31" AS valid_to
    FROM
      t_4_Person AS t_12_Person, t_6_Team AS t_13_Team, t_8_Events AS t_14_Events
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        t_9_NextChange AS t_17_NextChange
      WHERE
        (t_17_NextChange.person_id = t_12_Person.person_id) AND
        (t_17_NextChange.changed_at = t_14_Events.changed_at)) IS NULL) AND
      (t_14_Events.person_id = t_12_Person.person_id) AND
      (t_14_Events.team_id = t_13_Team.team_id)
  
) AS UNUSED_TABLE_NAME  ),
t_1_Member AS (SELECT
  Member_MultBodyAggAux.person_id AS person_id,
  Member_MultBodyAggAux.team_id AS team_id,
  Member_MultBodyAggAux.valid_from AS valid_from,
  Member_MultBodyAggAux.valid_to AS valid_to
FROM
  t_2_Member_MultBodyAggAux AS Member_MultBodyAggAux
GROUP BY 1, 2, 3, 4)
SELECT
  Member.person_id AS person_a,
  t_0_Member.person_id AS person_b,
  Member.team_id AS team_id,
  CASE WHEN (Member.valid_from > t_0_Member.valid_from) THEN Member.valid_from ELSE t_0_Member.valid_from END AS valid_from,
  CASE WHEN (Member.valid_to < t_0_Member.valid_to) THEN Member.valid_to ELSE t_0_Member.valid_to END AS valid_to
FROM
  t_1_Member AS Member, t_1_Member AS t_0_Member
WHERE
  (Member.person_id < t_0_Member.person_id) AND
  (CASE WHEN (Member.valid_from > t_0_Member.valid_from) THEN Member.valid_from ELSE t_0_Member.valid_from END < CASE WHEN (Member.valid_to < t_0_Member.valid_to) THEN Member.valid_to ELSE t_0_Member.valid_to END) AND
  (t_0_Member.team_id = Member.team_id)
GROUP BY 1, 2, 3, 4, 5 ORDER BY person_a NULLS LAST, person_b NULLS LAST, valid_from NULLS LAST;