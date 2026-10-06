-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      CAST(2.5 AS double precision) AS x
   UNION ALL
  
    SELECT
      1000000 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(((((t_0_V.x) * (t_0_V.x))) * (CAST(2.5 AS double precision)))) AS v
FROM
  t_1_V AS t_0_V;