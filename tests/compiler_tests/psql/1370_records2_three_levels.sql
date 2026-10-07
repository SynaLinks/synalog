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
-- Logica type: logicarecord520744032
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord520744032') then create type logicarecord520744032 as (c numeric); end if;
-- Logica type: logicarecord51356806
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord51356806') then create type logicarecord51356806 as (b logicarecord520744032); end if;
-- Logica type: logicarecord33862796
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord33862796') then create type logicarecord33862796 as (a logicarecord51356806); end if;
END $$;
WITH t_0_Emp AS (SELECT * FROM (
  
    SELECT
      'ann' AS name,
      'eng' AS dept,
      7000 AS salary,
      'paris' AS city
   UNION ALL
  
    SELECT
      'bob' AS name,
      'eng' AS dept,
      5200 AS salary,
      'lyon' AS city
   UNION ALL
  
    SELECT
      'cid' AS name,
      'ops' AS dept,
      4100 AS salary,
      'paris' AS city
   UNION ALL
  
    SELECT
      'dan' AS name,
      'ops' AS dept,
      3900 AS salary,
      'nice' AS city
   UNION ALL
  
    SELECT
      'eve' AS name,
      'sales' AS dept,
      6100 AS salary,
      'lyon' AS city
   UNION ALL
  
    SELECT
      'fay' AS name,
      'sales' AS dept,
      2800 AS salary,
      'paris' AS city
   UNION ALL
  
    SELECT
      'gus' AS name,
      'hr' AS dept,
      4500 AS salary,
      'nice' AS city
   UNION ALL
  
    SELECT
      'hal' AS name,
      'eng' AS dept,
      9100 AS salary,
      'nice' AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Emp.name AS name,
  ((ROW(ROW(Emp.salary)::logicarecord520744032)::logicarecord51356806).b).c AS c
FROM
  t_0_Emp AS Emp
WHERE
  (((ROW(ROW(Emp.salary)::logicarecord520744032)::logicarecord51356806).b).c > 6000) ORDER BY name, c;