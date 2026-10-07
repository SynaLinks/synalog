-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      2 AS v
   UNION ALL
  
    SELECT
      2 AS k,
      CAST(2.5 AS double precision) AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U.k AS k,
  U.v AS v
FROM
  t_0_U AS U ORDER BY k;