-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      CAST(null AS numeric) AS v
   UNION ALL
  
    SELECT
      2 AS k,
      7 AS v
   UNION ALL
  
    SELECT
      3 AS k,
      CAST(null AS numeric) AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(CASE WHEN (t_0_V.v IS null) THEN 1 ELSE 0 END) AS n
FROM
  t_1_V AS t_0_V;