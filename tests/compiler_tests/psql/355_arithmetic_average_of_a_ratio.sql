-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AVG((CAST(V.a AS double precision) / (V.b))) AS r
FROM
  t_0_V AS V;