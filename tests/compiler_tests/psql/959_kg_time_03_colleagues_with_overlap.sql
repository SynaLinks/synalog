-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

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
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY Employees.person_id, Employees.name, Employees.url ORDER BY person_id),
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
GROUP BY Teams.team_id, Teams.team ORDER BY team_id),
t_8_Events AS (SELECT * FROM (
  
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
t_9_NextChange AS (SELECT
  t_10_Events.person_id AS person_id,
  t_10_Events.changed_at AS changed_at,
  MIN(t_11_Events.changed_at) AS next
FROM
  t_8_Events AS t_10_Events, t_8_Events AS t_11_Events
WHERE
  (t_11_Events.changed_at > t_10_Events.changed_at) AND
  (t_11_Events.person_id = t_10_Events.person_id)
GROUP BY t_10_Events.person_id, t_10_Events.changed_at),
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
      '9999-12-31' AS valid_to
    FROM
      t_4_Person AS t_12_Person, t_6_Team AS t_13_Team, t_8_Events AS t_14_Events
    WHERE
      (CAST((SELECT
        MIN((CASE WHEN x_71 = 0 THEN 1 ELSE NULL END)) AS logica_value
      FROM
        t_9_NextChange AS t_17_NextChange, UNNEST(ARRAY[0]) as x_71
      WHERE
        (t_17_NextChange.person_id = t_12_Person.person_id) AND
        (t_17_NextChange.changed_at = t_14_Events.changed_at)) AS numeric) IS NULL) AND
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
GROUP BY Member_MultBodyAggAux.person_id, Member_MultBodyAggAux.team_id, Member_MultBodyAggAux.valid_from, Member_MultBodyAggAux.valid_to)
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
GROUP BY Member.person_id, t_0_Member.person_id, Member.team_id, CASE WHEN (Member.valid_from > t_0_Member.valid_from) THEN Member.valid_from ELSE t_0_Member.valid_from END, CASE WHEN (Member.valid_to < t_0_Member.valid_to) THEN Member.valid_to ELSE t_0_Member.valid_to END ORDER BY person_a, person_b, valid_from;