-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_Mine AS (SELECT * FROM (
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      9 AS x
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(Mine.x) AS m
FROM
  t_0_Mine AS Mine;
