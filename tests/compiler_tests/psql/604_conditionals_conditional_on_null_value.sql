-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      5 AS x
   UNION ALL
  
    SELECT
      2 AS k,
      CAST(null AS numeric) AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k,
  CASE WHEN (V.x IS null) THEN 'unset' ELSE 'set' END AS w
FROM
  t_0_V AS V ORDER BY k;