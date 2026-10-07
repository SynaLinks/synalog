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
WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      10 AS pid,
      8 AS hours
   UNION ALL
  
    SELECT
      1 AS id,
      11 AS pid,
      4 AS hours
   UNION ALL
  
    SELECT
      2 AS id,
      10 AS pid,
      12 AS hours
   UNION ALL
  
    SELECT
      3 AS id,
      12 AS pid,
      20 AS hours
   UNION ALL
  
    SELECT
      3 AS id,
      14 AS pid,
      2 AS hours
   UNION ALL
  
    SELECT
      4 AS id,
      12 AS pid,
      6 AS hours
   UNION ALL
  
    SELECT
      6 AS id,
      11 AS pid,
      15 AS hours
   UNION ALL
  
    SELECT
      5 AS id,
      13 AS pid,
      1 AS hours
  
) AS UNUSED_TABLE_NAME  ),
t_1_Proj AS (SELECT * FROM (
  
    SELECT
      10 AS pid,
      'red' AS team,
      300 AS budget
   UNION ALL
  
    SELECT
      11 AS pid,
      'red' AS team,
      1200 AS budget
   UNION ALL
  
    SELECT
      12 AS pid,
      'blue' AS team,
      800 AS budget
   UNION ALL
  
    SELECT
      13 AS pid,
      'green' AS team,
      50 AS budget
   UNION ALL
  
    SELECT
      14 AS pid,
      'blue' AS team,
      90 AS budget
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.id AS id,
  SUM(CASE WHEN (Proj.budget > 1000) THEN A.hours ELSE 0 END) AS h
FROM
  t_0_A AS A, t_1_Proj AS Proj
WHERE
  (Proj.pid = A.pid)
GROUP BY A.id ORDER BY id, h;