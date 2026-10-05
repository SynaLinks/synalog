-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1.5 AS x,
      42 AS y,
      CAST(null AS numeric) AS z
   UNION ALL
  
    SELECT
      2.5 AS x,
      7 AS y,
      1 AS z
  
) AS UNUSED_TABLE_NAME  )
SELECT
  CAST(V.x AS TEXT) AS a,
  CAST(V.y AS TEXT) AS b,
  CAST(V.z AS TEXT) AS c
FROM
  t_0_V AS V
WHERE
  (V.x < 2);