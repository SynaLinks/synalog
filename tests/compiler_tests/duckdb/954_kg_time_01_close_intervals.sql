-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

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
t_2_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_3_Employees AS Employees
GROUP BY Employees.person_id, Employees.name, Employees.url ORDER BY person_id),
t_5_Teams AS (SELECT * FROM (
  
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
t_4_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_5_Teams AS Teams
GROUP BY Teams.team_id, Teams.team ORDER BY team_id),
t_6_Events AS (SELECT * FROM (
  
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
t_7_NextChange AS (SELECT
  t_8_Events.person_id AS person_id,
  t_8_Events.changed_at AS changed_at,
  MIN(t_9_Events.changed_at) AS next
FROM
  t_6_Events AS t_8_Events, t_6_Events AS t_9_Events
WHERE
  (t_9_Events.changed_at > t_8_Events.changed_at) AND
  (t_9_Events.person_id = t_8_Events.person_id)
GROUP BY t_8_Events.person_id, t_8_Events.changed_at),
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
      '9999-12-31' AS valid_to
    FROM
      t_2_Person AS t_10_Person, t_4_Team AS t_11_Team, t_6_Events AS t_12_Events
    WHERE
      ((SELECT
        MIN((CASE WHEN x_58.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
      FROM
        t_7_NextChange AS t_15_NextChange, (select unnest([0]) as unnested_pod) as x_58
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
GROUP BY Member_MultBodyAggAux.person_id, Member_MultBodyAggAux.team_id, Member_MultBodyAggAux.valid_from, Member_MultBodyAggAux.valid_to ORDER BY person_id, valid_from;