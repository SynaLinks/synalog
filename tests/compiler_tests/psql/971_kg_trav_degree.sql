-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
WITH t_6_Employees AS (SELECT * FROM (
  
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
t_5_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_6_Employees AS Employees
GROUP BY Employees.person_id, Employees.name, Employees.url ORDER BY person_id),
t_8_Management AS (SELECT * FROM (
  
    SELECT
      1 AS manager_id,
      2 AS employee_id
   UNION ALL
  
    SELECT
      1 AS manager_id,
      5 AS employee_id
   UNION ALL
  
    SELECT
      4 AS manager_id,
      3 AS employee_id
   UNION ALL
  
    SELECT
      2 AS manager_id,
      6 AS employee_id
  
) AS UNUSED_TABLE_NAME  ),
t_3_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_4_Person.person_id AS employee_id
FROM
  t_5_Person AS Person, t_5_Person AS t_4_Person, t_8_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_4_Person.person_id)
GROUP BY Person.person_id, t_4_Person.person_id),
t_12_Mentoring AS (SELECT * FROM (
  
    SELECT
      2 AS mentor_id,
      5 AS mentee_id
   UNION ALL
  
    SELECT
      1 AS mentor_id,
      4 AS mentee_id
  
) AS UNUSED_TABLE_NAME  ),
t_9_Mentors AS (SELECT
  t_10_Person.person_id AS mentor_id,
  t_11_Person.person_id AS mentee_id
FROM
  t_5_Person AS t_10_Person, t_5_Person AS t_11_Person, t_12_Mentoring AS Mentoring
WHERE
  (Mentoring.mentor_id = t_10_Person.person_id) AND
  (Mentoring.mentee_id = t_11_Person.person_id)
GROUP BY t_10_Person.person_id, t_11_Person.person_id),
t_2_Related_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source_id,
      Manages.employee_id AS target_id,
      'manages' AS type
    FROM
      t_3_Manages AS Manages
   UNION ALL
  
    SELECT
      Mentors.mentor_id AS source_id,
      Mentors.mentee_id AS target_id,
      'mentors' AS type
    FROM
      t_9_Mentors AS Mentors
  
) AS UNUSED_TABLE_NAME  ),
t_1_Related AS (SELECT
  Related_MultBodyAggAux.source_id AS source_id,
  Related_MultBodyAggAux.target_id AS target_id,
  Related_MultBodyAggAux.type AS type
FROM
  t_2_Related_MultBodyAggAux AS Related_MultBodyAggAux
GROUP BY Related_MultBodyAggAux.source_id, Related_MultBodyAggAux.target_id, Related_MultBodyAggAux.type),
t_0_Endpoint AS (SELECT * FROM (
  
    SELECT
      Related.source_id AS node_id,
      Related.source_id AS source_id,
      Related.target_id AS target_id,
      Related.type AS type
    FROM
      t_1_Related AS Related
   UNION ALL
  
    SELECT
      t_13_Related.target_id AS node_id,
      t_13_Related.source_id AS source_id,
      t_13_Related.target_id AS target_id,
      t_13_Related.type AS type
    FROM
      t_1_Related AS t_13_Related
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Endpoint.node_id AS node_id,
  SUM(1) AS n
FROM
  t_0_Endpoint AS Endpoint
GROUP BY Endpoint.node_id ORDER BY node_id;