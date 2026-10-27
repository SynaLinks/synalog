-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
t_5_Mentoring AS (SELECT * FROM (
  
    SELECT
      2 AS mentor_id,
      5 AS mentee_id
   UNION ALL
  
    SELECT
      1 AS mentor_id,
      4 AS mentee_id
  
) AS UNUSED_TABLE_NAME  ),
t_0_Mentors AS (SELECT
  Person.person_id AS mentor_id,
  t_1_Person.person_id AS mentee_id
FROM
  t_2_Person AS Person, t_2_Person AS t_1_Person, t_5_Mentoring AS Mentoring
WHERE
  (COALESCE(Mentoring.mentor_id, 0) = COALESCE(Person.person_id, 0) AND (Mentoring.mentor_id IS NULL) = (Person.person_id IS NULL)) AND
  (COALESCE(Mentoring.mentee_id, 0) = COALESCE(t_1_Person.person_id, 0) AND (Mentoring.mentee_id IS NULL) = (t_1_Person.person_id IS NULL))
GROUP BY Person.person_id, t_1_Person.person_id)
SELECT
  Mentors.mentee_id AS mentee_id
FROM
  t_0_Mentors AS Mentors
WHERE
  (Mentors.mentor_id = 2)
GROUP BY Mentors.mentee_id ORDER BY mentee_id;