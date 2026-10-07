-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'g' AS g,
      7 AS x
   UNION ALL
  
    SELECT
      'g' AS g,
      7 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.g AS g,
  MIN(t_0_V.x) AS v
FROM
  t_1_V AS t_0_V
GROUP BY t_0_V.g;