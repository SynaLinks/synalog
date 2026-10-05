-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      CAST(null AS numeric) AS x
   UNION ALL
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      5 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x
FROM
  t_0_V AS V
WHERE
  ((V.x IS null) OR (V.x > 1)) ORDER BY x NULLS FIRST;