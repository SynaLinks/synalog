-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_V AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      2 AS k,
      1 AS v
   UNION ALL
  
    SELECT
      'x' AS g,
      1 AS k,
      2 AS v
   UNION ALL
  
    SELECT
      'y' AS g,
      5 AS k,
      3 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.g AS g,
  ARRAY_AGG(t_0_V.v order by t_0_V.k) AS l
FROM
  t_3_V AS t_0_V
GROUP BY t_0_V.g ORDER BY g;