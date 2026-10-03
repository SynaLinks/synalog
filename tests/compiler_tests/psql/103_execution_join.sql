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
WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      'ann' AS name,
      1 AS city_id
   UNION ALL
  
    SELECT
      'bob' AS name,
      2 AS city_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_City AS (SELECT * FROM (
  
    SELECT
      1 AS city_id,
      'paris' AS city
   UNION ALL
  
    SELECT
      2 AS city_id,
      'rome' AS city
   UNION ALL
  
    SELECT
      3 AS city_id,
      'oslo' AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.name AS name,
  City.city AS city
FROM
  t_0_Person AS Person, t_1_City AS City
WHERE
  (City.city_id = Person.city_id) ORDER BY name;