-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      3 AS s
   UNION ALL
  
    SELECT
      'b' AS n,
      5 AS s
   UNION ALL
  
    SELECT
      'c' AS n,
      1 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (ARRAY_AGG(V.n order by V.s desc nulls last))[1] AS w
FROM
  t_1_V AS V;