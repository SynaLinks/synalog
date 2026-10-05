-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      CAST(null AS numeric) AS g,
      1 AS x
   UNION ALL
  
    SELECT
      CAST(null AS numeric) AS g,
      2 AS x
   UNION ALL
  
    SELECT
      1 AS g,
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  SUM(1) AS n
FROM
  t_0_V AS V
GROUP BY V.g ORDER BY g nulls first;