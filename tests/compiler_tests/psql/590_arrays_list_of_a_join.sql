-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_X AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a' AS v
   UNION ALL
  
    SELECT
      1 AS k,
      'b' AS v
   UNION ALL
  
    SELECT
      2 AS k,
      'c' AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG(X.v) AS l
FROM
  t_3_X AS X
WHERE
  (X.k = 1))
SELECT
  CARDINALITY(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L;