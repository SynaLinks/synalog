-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      true AS b
   UNION ALL
  
    SELECT
      1 AS k,
      false AS b
   UNION ALL
  
    SELECT
      2 AS k,
      true AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k,
  BOOL_AND(V.b) AS lo,
  BOOL_OR(V.b) AS hi
FROM
  t_0_V AS V
GROUP BY V.k ORDER BY k;