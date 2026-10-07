-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_X AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      17 AS x
   UNION ALL
  
    SELECT
      2 AS k,
      -17 AS x
   UNION ALL
  
    SELECT
      3 AS k,
      4 AS x
   UNION ALL
  
    SELECT
      4 AS k,
      0 AS x
   UNION ALL
  
    SELECT
      5 AS k,
      CAST(null AS numeric) AS x
   UNION ALL
  
    SELECT
      6 AS k,
      3000000000 AS x
   UNION ALL
  
    SELECT
      7 AS k,
      -1 AS x
   UNION ALL
  
    SELECT
      8 AS k,
      9 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  CASE WHEN (t_0_X.x > 0) THEN 1 WHEN (t_0_X.x < 0) THEN -1 ELSE 0 END AS s,
  SUM(t_0_X.x) AS t
FROM
  t_1_X AS t_0_X
GROUP BY CASE WHEN (t_0_X.x > 0) THEN 1 WHEN (t_0_X.x < 0) THEN -1 ELSE 0 END ORDER BY s;