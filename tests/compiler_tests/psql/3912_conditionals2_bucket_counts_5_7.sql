-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      5 AS x,
      'a' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -3 AS x,
      CAST(null AS text) AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      'c' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      CAST(null AS numeric) AS x,
      'd' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      CAST(null AS text) AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      'f' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  CASE WHEN (V.x < 5) THEN 'low' WHEN (V.x < 7) THEN 'mid' ELSE 'high' END AS b,
  SUM(1) AS n
FROM
  t_0_V AS V
WHERE
  (V.x IS NOT null)
GROUP BY CASE WHEN (V.x < 5) THEN 'low' WHEN (V.x < 7) THEN 'mid' ELSE 'high' END ORDER BY b;