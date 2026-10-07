-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_City AS (SELECT * FROM (
  
    SELECT
      'fr' AS code,
      'paris' AS city
   UNION ALL
  
    SELECT
      'de' AS code,
      'berlin' AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_City.code AS code,
  t_0_City.city AS city
FROM
  t_1_City AS t_0_City
WHERE
  ('fr' = t_0_City.code);