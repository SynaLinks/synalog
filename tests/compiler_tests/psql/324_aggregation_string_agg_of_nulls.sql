-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'g' AS g,
      null AS s
   UNION ALL
  
    SELECT
      'h' AS g,
      null AS s
   UNION ALL
  
    SELECT
      'h' AS g,
      'x' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  STRING_AGG(CAST(V.s AS TEXT), ',') AS s
FROM
  t_0_V AS V
GROUP BY V.g ORDER BY g;