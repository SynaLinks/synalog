-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      10 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      12 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.a AS a,
  V.b AS b,
  (MOD(CAST(V.a AS numeric), NULLIF(CAST(V.b AS numeric), 0))) AS r
FROM
  t_0_V AS V ORDER BY a;