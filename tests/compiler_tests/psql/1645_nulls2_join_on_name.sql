-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_Person AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS name,
      30 AS age
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS name,
      CAST(null AS numeric) AS age
   UNION ALL
  
    SELECT
      3 AS id,
      'cid' AS name,
      25 AS age
   UNION ALL
  
    SELECT
      4 AS id,
      CAST(null AS text) AS name,
      40 AS age
   UNION ALL
  
    SELECT
      5 AS id,
      'eve' AS name,
      CAST(null AS numeric) AS age
  
) AS UNUSED_TABLE_NAME  ),
t_2_Role AS (SELECT * FROM (
  
    SELECT
      'ann' AS name,
      'admin' AS role
   UNION ALL
  
    SELECT
      'cid' AS name,
      'user' AS role
   UNION ALL
  
    SELECT
      CAST(null AS text) AS name,
      'ghost' AS role
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.id AS id,
  t_0_Role.role AS role
FROM
  t_1_Person AS Person, t_2_Role AS t_0_Role
WHERE
  (COALESCE(t_0_Role.name, '') = COALESCE(Person.name, '') AND (t_0_Role.name IS NULL) = (Person.name IS NULL)) ORDER BY id, role;
