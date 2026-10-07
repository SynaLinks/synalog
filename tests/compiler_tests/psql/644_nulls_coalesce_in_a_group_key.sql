-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      CAST(null AS text) AS g
   UNION ALL
  
    SELECT
      CAST(null AS text) AS g
   UNION ALL
  
    SELECT
      'x' AS g
  
) AS UNUSED_TABLE_NAME  )
SELECT
  COALESCE(V.g, 'none') AS k,
  SUM(1) AS n
FROM
  t_0_V AS V
GROUP BY COALESCE(V.g, 'none') ORDER BY k;