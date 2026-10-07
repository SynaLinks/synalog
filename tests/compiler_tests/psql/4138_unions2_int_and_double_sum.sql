-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      2 AS v
   UNION ALL
  
    SELECT
      CAST(2.5 AS double precision) AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(U.v) AS s
FROM
  t_0_U AS U;