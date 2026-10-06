-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      CAST(2.0 AS double precision) AS x
   UNION ALL
  
    SELECT
      CAST(2.0 AS double precision) AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_D AS (SELECT
  V.x AS x
FROM
  t_1_V AS V
GROUP BY V.x)
SELECT
  SUM(1) AS n
FROM
  t_0_D AS D;