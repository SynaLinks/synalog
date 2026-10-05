-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_Person AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(Person.age) AS m
FROM
  t_0_Person AS Person;
