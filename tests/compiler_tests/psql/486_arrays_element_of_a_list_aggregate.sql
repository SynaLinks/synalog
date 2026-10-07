-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_5_V AS (SELECT * FROM (
  
    SELECT
      2 AS k,
      'b' AS v
   UNION ALL
  
    SELECT
      1 AS k,
      'a' AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG(t_2_V.v order by t_2_V.k) AS l
FROM
  t_5_V AS t_2_V)
SELECT
  (t_0_L.l)[0 + 1] AS first
FROM
  t_1_L AS t_0_L;