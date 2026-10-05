-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  V.g AS g,
  ARRAY_AGG(V.x) AS l
FROM
  t_2_V AS V
GROUP BY V.g)
SELECT
  t_0_L.g AS g,
  CARDINALITY(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L ORDER BY g;