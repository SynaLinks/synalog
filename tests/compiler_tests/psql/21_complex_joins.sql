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
WITH t_0_Users AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Alice' AS name,
      101 AS dept
   UNION ALL
  
    SELECT
      2 AS id,
      'Bob' AS name,
      102 AS dept
   UNION ALL
  
    SELECT
      3 AS id,
      'Charlie' AS name,
      101 AS dept
  
) AS UNUSED_TABLE_NAME  ),
t_1_Departments AS (SELECT * FROM (
  
    SELECT
      101 AS id,
      'Engineering' AS name
   UNION ALL
  
    SELECT
      102 AS id,
      'Marketing' AS name
   UNION ALL
  
    SELECT
      103 AS id,
      'Sales' AS name
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Users.name AS user_name,
  Departments.name AS dept_name
FROM
  t_0_Users AS Users, t_1_Departments AS Departments
WHERE
  (Departments.id = Users.dept) ORDER BY user_name;