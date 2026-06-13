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
WITH t_1_Students AS (SELECT * FROM (
  
    SELECT
      'Alice' AS name,
      85 AS grade
   UNION ALL
  
    SELECT
      'Bob' AS name,
      72 AS grade
  
) AS UNUSED_TABLE_NAME  ),
t_2_Teachers AS (SELECT * FROM (
  
    SELECT
      'Prof Smith' AS name,
      'Math' AS department
   UNION ALL
  
    SELECT
      'Prof Jones' AS name,
      'Science' AS department
  
) AS UNUSED_TABLE_NAME  ),
t_0_People AS (SELECT * FROM (
  
    SELECT
      Students.name AS name,
      'student' AS role
    FROM
      t_1_Students AS Students
   UNION ALL
  
    SELECT
      Teachers.name AS name,
      'teacher' AS role
    FROM
      t_2_Teachers AS Teachers
  
) AS UNUSED_TABLE_NAME  )
SELECT
  People.name AS name,
  People.role AS role
FROM
  t_0_People AS People ORDER BY name;